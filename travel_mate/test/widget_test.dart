// Experiment 10(a): Unit tests and a widget test for the counter app.
//
// test()   -> defines a unit test case
// expect() -> compares actual vs expected values
//
// Run:  flutter test

import 'package:flutter_test/flutter_test.dart';

import 'package:travel_mate/experiments/exp10a_counter_app.dart';

void main() {
  group('CounterData (unit tests)', () {
    test('count starts at 0', () {
      final counter = CounterData();
      expect(counter.count, 0);
    });

    test('increment() increases count by 1', () {
      final counter = CounterData();
      counter.increment();
      expect(counter.count, 1);
    });

    test('increment() notifies listeners', () {
      final counter = CounterData();
      int notifications = 0;
      counter.addListener(() => notifications++);

      counter.increment();
      counter.increment();

      expect(counter.count, 2);
      expect(notifications, 2);
    });
  });

  group('CounterApp (widget test)', () {
    testWidgets('shows 0, then 1 after tapping Increment', (tester) async {
      await tester.pumpWidget(const CounterApp());

      expect(find.text('Simple Counter App'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await tester.tap(find.text('Increment'));
      await tester.pump();

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
