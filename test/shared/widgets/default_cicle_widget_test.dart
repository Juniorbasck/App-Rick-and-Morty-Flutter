import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ricka_and_morty/shared/widgets/default_cicle_widget.dart';

void main() {
  group('cicle widget default tests', () {
    testWidgets('contains only a container', (tester) async {
      await tester.pumpWidget(const DefaultCicleWidget(status: ''));

      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('contains a widget with a key', (tester) async {
      const testkey = Key('testkey');
      await tester.pumpWidget(const MaterialApp(
        home: DefaultCicleWidget(
          status: '',
          key: testkey,
        ),
      ));

      expect(find.byKey(testkey), findsOneWidget);
    });
  });

  group('cicle widget color decoration tests', () {
    testWidgets('contains a red decoration', (testar) async {
      await testar.pumpWidget(const DefaultCicleWidget(status: 'dead'));
      final container =
          find.byType(Container).evaluate().single.widget as Container;

      expect((container.decoration as BoxDecoration).color, Colors.red);
    });

    testWidgets('contains a grey decoration', (testar) async {
      await testar.pumpWidget(const DefaultCicleWidget(status: 'unknown'));
      final container =
          find.byType(Container).evaluate().single.widget as Container;

      expect((container.decoration as BoxDecoration).color, Colors.grey);
    });
  });
}
