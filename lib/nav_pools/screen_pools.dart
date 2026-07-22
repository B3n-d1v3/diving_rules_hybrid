import 'dart:async';
import 'dart:io';

import 'package:apple_maps_flutter/apple_maps_flutter.dart' as apple_maps;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;

import '../l10n/diving_rules_localizations.dart';
import '../models/globals.dart';
import '../models/pool_model.dart';
import '../models/pools_repository.dart' show PoolsSource;
import '../models/token_spacing.dart';
import 'pool_detail_sheet.dart';
import 'pools_map_buttons.dart';
import 'pools_map_controller.dart';

class ScreenPools extends StatefulWidget {
  const ScreenPools({super.key});

  @override
  State<ScreenPools> createState() => _ScreenPoolsState();
}

class _ScreenPoolsState extends State<ScreenPools> {
  late final PoolsMapController controller;

  @override
  void initState() {
    super.initState();
    currentPage = 'pools';
    // could be 'start', 'rulebook', 'penalties', 'quiz', 'pools', 'about'
    controller = Get.put(PoolsMapController());
    controller.loadPools();
  }

  void _showPoolDetail(Pool pool) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => PoolDetailSheet(pool: pool),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            if (Platform.isAndroid)
              _GoogleMapsPoolsBody(
                  controller: controller, onPoolTap: _showPoolDetail)
            else if (Platform.isIOS)
              _AppleMapsPoolsBody(
                  controller: controller, onPoolTap: _showPoolDetail),
            if (controller.isLoading.value)
              const Center(child: CircularProgressIndicator()),
            if (!controller.isLoading.value &&
                controller.source.value != null &&
                controller.source.value != PoolsSource.live)
              const _OfflineBanner(key: ValueKey('pools-offline-banner')),
            PoolsMapOverlayButtons(controller: controller),
          ],
        ));
  }
}

/// Tells the user the map is showing cached/bundled data rather than a live
/// fetch. Slides in from under the AppBar, then auto-dismisses after 20s so
/// it doesn't linger and cover the map indefinitely.
class _OfflineBanner extends StatefulWidget {
  const _OfflineBanner({super.key});

  @override
  State<_OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<_OfflineBanner> {
  bool _visible = false;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    // Starts hidden (offset above the AppBar) so the first frame after
    // becoming visible has a "start" state for the slide-in to animate from.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _visible = true);
    });
    _dismissTimer = Timer(const Duration(seconds: 20), () {
      if (mounted) setState(() => _visible = false);
    });
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DRSpacing.m,
      left: DRSpacing.m,
      // Stops short of the locate-me/add-pool buttons column instead of
      // running underneath it.
      right: DRSpacing.m + poolsMapButtonSize + DRSpacing.s,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : const Offset(0, -2),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(DRSpacing.s),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: DRSpacing.m, vertical: DRSpacing.s),
            child: Text(
              AppLocalizations.of(context)!.poolsOfflineBanner,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}

class _GoogleMapsPoolsBody extends StatelessWidget {
  const _GoogleMapsPoolsBody({required this.controller, required this.onPoolTap});

  final PoolsMapController controller;
  final void Function(Pool pool) onPoolTap;

  @override
  Widget build(BuildContext context) {
    final markers = controller.pools
        .map((pool) => google_maps.Marker(
              markerId: google_maps.MarkerId(pool.id),
              position: google_maps.LatLng(pool.lat, pool.lng),
              infoWindow: google_maps.InfoWindow(title: pool.cityNameTitleCase),
              icon: google_maps.BitmapDescriptor.defaultMarkerWithHue(
                  google_maps.BitmapDescriptor.hueBlue),
              onTap: () => onPoolTap(pool),
            ))
        .toSet();

    return google_maps.GoogleMap(
      initialCameraPosition: const google_maps.CameraPosition(
        target: poolsInitialCameraTarget,
        zoom: poolsInitialCameraZoom,
      ),
      onMapCreated: controller.registerGoogleMapController,
      markers: markers,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
    );
  }
}

class _AppleMapsPoolsBody extends StatelessWidget {
  const _AppleMapsPoolsBody({required this.controller, required this.onPoolTap});

  final PoolsMapController controller;
  final void Function(Pool pool) onPoolTap;

  @override
  Widget build(BuildContext context) {
    final annotations = controller.pools
        .map((pool) => apple_maps.Annotation(
              annotationId: apple_maps.AnnotationId(pool.id),
              position: apple_maps.LatLng(pool.lat, pool.lng),
              infoWindow: apple_maps.InfoWindow(title: pool.cityNameTitleCase),
              icon: apple_maps.BitmapDescriptor.defaultAnnotationWithHue(
                  google_maps.BitmapDescriptor.hueBlue),
              onTap: () => onPoolTap(pool),
            ))
        .toSet();

    return apple_maps.AppleMap(
      initialCameraPosition: apple_maps.CameraPosition(
        target: apple_maps.LatLng(
          poolsInitialCameraTarget.latitude,
          poolsInitialCameraTarget.longitude,
        ),
        zoom: poolsInitialCameraZoom,
      ),
      onMapCreated: controller.registerAppleMapController,
      annotations: annotations,
      myLocationButtonEnabled: false,
    );
  }
}
