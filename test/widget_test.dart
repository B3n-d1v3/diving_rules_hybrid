import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:diving_rules_hybrid/main.dart';

void main() {
  testWidgets('DivingRulesApp launches and shows the main navigation',
      (WidgetTester tester) async {
    // Force a mobile-width viewport so the bottom navigation bar is used
    // instead of the wide-screen NavigationRail.
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const DivingRulesApp());
    // Avoid pumpAndSettle: the Rules tab embeds a PDF viewer with a
    // long-running ticker (scrollbar fade) that never fully settles.
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    final bottomNavigationBar =
        tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
    expect(bottomNavigationBar.items, hasLength(4));
  });
}
