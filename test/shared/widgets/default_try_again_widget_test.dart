import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ricka_and_morty/shared/widgets/default_try_again_widget.dart';

void main() {
  testWidgets('has one try again message', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DefaultTryAgainWidget(),
      ),
    );

    expect(find.text('Try again'), findsOneWidget);
  });

  testWidgets('has one something wrong message', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DefaultTryAgainWidget(),
      ),
    );

    expect(find.text('ops! something went wrong'), findsOneWidget);
  });
}
