import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/diving_rules_localizations.dart';
import '../models/pool_model.dart';
import '../models/token_spacing.dart';
import 'pools_map_buttons.dart';

/// Content shown when a pool's marker/annotation is tapped, on either
/// platform map. Header (drag handle + title + close button) stays pinned
/// so a long description can never trap the user without a way back to the
/// map - only the body scrolls, and the whole sheet is capped well short of
/// full screen height.
class PoolDetailSheet extends StatelessWidget {
  const PoolDetailSheet({super.key, required this.pool});

  final Pool pool;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          // Leaves enough of the map visible above the sheet that the user
          // can both see it and tap it to dismiss (default modal barrier
          // behavior), not just use the close button.
          maxHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: DRSpacing.s),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(DRSpacing.xs),
                    ),
                  ),
                ),
                Padding(
                  // Right padding clears the close button positioned over
                  // this corner, so a long title never runs under it.
                  padding: EdgeInsets.fromLTRB(DRSpacing.l, DRSpacing.s, DRSpacing.l, DRSpacing.m),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        pool.cityNameTitleCase,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '${pool.poolName} (${pool.departmentCode})',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    // Top matches the gap above the title (handle margin +
                    // its own top padding), so the subtitle gets the same
                    // breathing room before the scrollable content starts.
                    padding: EdgeInsets.fromLTRB(
                        DRSpacing.l, DRSpacing.x4l, DRSpacing.l, DRSpacing.l),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Html(
                            data: pool.descriptionHtml,
                            // The source data's default HTML block margins
                            // (body/p) leave large unwanted empty gaps
                            // between images and text - trim them down.
                            style: {
                              "body": Style(
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                              ),
                              "p": Style(
                                margin: Margins.symmetric(vertical: 4),
                              ),
                            },
                            // flutter_html's built-in "img" handling declares
                            // a Style.alignment field but never actually
                            // reads it, so images can't be centered via
                            // style alone - render them ourselves instead,
                            // each in a full-width box with the photo
                            // centered inside it.
                            extensions: const [_CenteredImageExtension()],
                          ),
                        ),
                        SizedBox(height: DRSpacing.m),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                          onPressed: () async {
                            // Opens the device's own native maps app rather
                            // than a Google Maps web link.
                            final directionsUrl = Platform.isAndroid
                                ? Uri.parse(
                                    'geo:${pool.lat},${pool.lng}?q=${pool.lat},${pool.lng}(${Uri.encodeComponent(pool.poolName)})')
                                : Uri.parse(
                                    'https://maps.apple.com/?daddr=${pool.lat},${pool.lng}');
                            await launchUrl(directionsUrl,
                                mode: LaunchMode.externalApplication);
                          },
                          icon: const Icon(
                            CupertinoIcons.location_solid,
                            size: 24.0,
                          ),
                          label: Text(
                              AppLocalizations.of(context)!.poolsGetDirections,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w900)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: DRSpacing.m,
              right: DRSpacing.m,
              child: PoolsRoundIconButton(
                icon: CupertinoIcons.clear_circled,
                tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                onPressed: () => Navigator.of(context).pop(),
                iconSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Renders `<img>` tags centered in a full-width box, since
/// flutter_html's built-in image handling doesn't actually honor
/// Style.alignment (see comment at the call site).
class _CenteredImageExtension extends HtmlExtension {
  const _CenteredImageExtension();

  @override
  Set<String> get supportedTags => {"img"};

  @override
  bool matches(ExtensionContext context) => context.elementName == "img";

  @override
  InlineSpan build(ExtensionContext context) {
    final src = context.attributes["src"];
    if (src == null) return const TextSpan();

    final height = double.tryParse(context.attributes["height"] ?? "") ?? 200;

    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Image.network(
            src,
            height: height,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
