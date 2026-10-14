import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:student_portfolio/main.dart';

void main() {
  testWidgets('login page shows portfolio inputs and navigates to dashboard',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('My Portfolio'), findsOneWidget);
    expect(find.text('Roll No'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), '21WH1A0588');
    await tester.enterText(find.byType(TextField).at(1), '1234');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('1. About Me'), findsOneWidget);
    expect(find.text('5. Logout -> Back to Login Page'), findsOneWidget);
  });
}
