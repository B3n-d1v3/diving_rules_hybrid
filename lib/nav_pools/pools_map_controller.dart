import 'package:apple_maps_flutter/apple_maps_flutter.dart' as apple_maps;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;

import '../l10n/diving_rules_localizations.dart';
import '../models/pool_model.dart';
import '../models/pools_repository.dart';

/// Camera centered on France, reused from the shared My Maps link so all
/// current pools fit on screen at first launch.
const google_maps.LatLng poolsInitialCameraTarget =
    google_maps.LatLng(46.77962820152437, 2.7211638000000034);
const double poolsInitialCameraZoom = 5.5;
const double poolsLocateMeZoom = 12;

/// Shared state/behavior behind the Pools tab, whichever platform map body
/// is actually on screen (Google Maps on Android, Apple Maps on iOS). Lets
/// the AppBar's locate-me/add-pool buttons - siblings of the map body in the
/// widget tree - act on whichever native map controller is currently live.
class PoolsMapController extends GetxController {
  final PoolsRepository _repository = PoolsRepository();

  final RxList<Pool> pools = <Pool>[].obs;
  final RxBool isLoading = true.obs;
  final Rx<PoolsSource?> source = Rx<PoolsSource?>(null);

  google_maps.GoogleMapController? _googleMapController;
  apple_maps.AppleMapController? _appleMapController;

  Future<void> loadPools() async {
    isLoading.value = true;
    final result = await _repository.loadPools();
    pools.assignAll(result.pools);
    source.value = result.source;
    isLoading.value = false;
  }

  void registerGoogleMapController(
      google_maps.GoogleMapController controller) {
    _googleMapController = controller;
  }

  void registerAppleMapController(apple_maps.AppleMapController controller) {
    _appleMapController = controller;
  }

  /// Only ever called from the AppBar's locate-me button tap - this is the
  /// single place location permission is requested in the app.
  Future<void> locateMe(BuildContext context) async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)!.poolsLocationDenied),
        ));
      }
      return;
    }

    final position = await Geolocator.getCurrentPosition();

    if (_googleMapController != null) {
      await _googleMapController!.animateCamera(
        google_maps.CameraUpdate.newLatLngZoom(
          google_maps.LatLng(position.latitude, position.longitude),
          poolsLocateMeZoom,
        ),
      );
    } else if (_appleMapController != null) {
      await _appleMapController!.animateCamera(
        apple_maps.CameraUpdate.newLatLngZoom(
          apple_maps.LatLng(position.latitude, position.longitude),
          poolsLocateMeZoom,
        ),
      );
    }
  }
}
