// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:expenses_management_project/main.dart';

void main() {
  testWidgets('Shows login form by default', (WidgetTester tester) async {
    await tester.pumpWidget(const ExpensesTrainingApp());

    // "Connexion" peut apparaitre plusieurs fois (titre + bouton).
    // On teste donc le bouton principal et un champ du formulaire.
    expect(find.widgetWithText(ElevatedButton, 'Connexion'), findsOneWidget);
    expect(find.text('Telephone'), findsOneWidget);
  });
}
