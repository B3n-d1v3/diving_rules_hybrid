import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/diving_rules_localizations.dart';
import '../models/token_spacing.dart';
import 'pools_constants.dart';
import 'pools_map_controller.dart';

/// Visual footprint (logical px) of a default-sized [PoolsRoundIconButton] -
/// shared with sibling overlays (e.g. the offline banner) so they can size
/// themselves to avoid rendering underneath these floating buttons.
const double poolsMapButtonSize = 48;

/// Locate-me / add-pool controls floating over the map itself (rather than
/// the shared AppBar, which was getting too crowded on narrower screens).
/// Shared between the Google Maps (Android) and Apple Maps (iOS) bodies.
class PoolsMapOverlayButtons extends StatelessWidget {
  const PoolsMapOverlayButtons({super.key, required this.controller});

  final PoolsMapController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DRSpacing.m,
      right: DRSpacing.m,
      child: Column(
        children: [
          PoolsRoundIconButton(
            icon: CupertinoIcons.location_circle,
            tooltip: AppLocalizations.of(context)!.poolsLocateMeTooltip,
            onPressed: () => controller.locateMe(context),
            iconRotationDegrees: 20,
          ),
          SizedBox(height: DRSpacing.s),
          PoolsRoundIconButton(
            icon: CupertinoIcons.add_circled,
            tooltip: AppLocalizations.of(context)!.poolsAddPoolTooltip,
            onPressed: () async {
              final formUrl = Uri.parse(poolsSubmissionFormUrl);
              await launchUrl(formUrl, mode: LaunchMode.externalApplication);
            },
          ),
        ],
      ),
    );
  }
}

class PoolsRoundIconButton extends StatelessWidget {
  const PoolsRoundIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.iconRotationDegrees = 0,
    this.iconSize = poolsMapButtonSize,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final double iconRotationDegrees;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    // Slightly smaller than the icon so no white ring shows past the glyph.
    final backgroundSize = iconSize - 6;

    return Tooltip(
      message: tooltip,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: backgroundSize,
            height: backgroundSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onPressed,
              child: Transform.rotate(
                angle: iconRotationDegrees * math.pi / 180,
                child: Icon(
                  icon,
                  size: iconSize,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
