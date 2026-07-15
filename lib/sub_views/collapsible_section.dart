import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/token_spacing.dart';

/// A collapsible section: a tinted, outlined header (using the theme's
/// secondary container) that expands to reveal arbitrary content on the
/// normal surface background. Used by the checklist pages (static,
/// always-checked items) and the judge penalties page (tappable penalty
/// rows grouped by sanction).
class CollapsibleSection extends StatefulWidget {
  const CollapsibleSection({
    super.key,
    required this.title,
    required this.children,
    this.initiallyExpanded = false,
  });

  final String title;
  final List<Widget> children;
  final bool initiallyExpanded;

  @override
  State<CollapsibleSection> createState() => _CollapsibleSectionState();
}

class _CollapsibleSectionState extends State<CollapsibleSection> {
  late bool _expanded = widget.initiallyExpanded;

  static const double _radius = 12;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderRadius = BorderRadius.circular(_radius);

    return Container(
      margin: EdgeInsets.only(bottom: DRSpacing.m),
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.secondary),
        borderRadius: borderRadius,
      ),
      // The border is painted by this Container's decoration; the content
      // is clipped separately (rather than relying on Container's own
      // clipBehavior) so the fill and the border share exactly the same
      // rounded-rect geometry instead of drifting apart by a pixel or two.
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Container(
                color: colorScheme.secondaryContainer,
                padding: EdgeInsets.symmetric(
                  horizontal: DRSpacing.l,
                  vertical: DRSpacing.m,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: colorScheme.onSecondaryContainer,
                            ),
                      ),
                    ),
                    Icon(
                      _expanded
                          ? CupertinoIcons.chevron_up
                          : CupertinoIcons.chevron_down,
                      color: colorScheme.onSecondaryContainer,
                    ),
                  ],
                ),
              ),
            ),
            if (_expanded) ...widget.children,
          ],
        ),
      ),
    );
  }
}
