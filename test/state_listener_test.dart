// test/state_listener_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:my_state_management/my_state_management.dart';

void main() {
  testWidgets('StateListener rebuilds on state change',
      (WidgetTester tester) async {
    final stateManager = StateManager();
    stateManager.initializeState('counter', 0);

    await tester.pumpWidget(
      MaterialApp(
        home: StateListener<int>(
          stateKey: 'counter',
          builder: (context, state) => Text('$state'),
          stateManager: stateManager,
        ),
      ),
    );

    expect(find.text('0'), findsOneWidget);

    stateManager.updateState('counter', 5);
    await tester.pump();

    expect(find.text('5'), findsOneWidget);
  });
}
