// test/state_manager_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_state_management/my_state_management.dart';

void main() {
  group('StateManager', () {
    test('should initialize, update, and retrieve state', () {
      final stateManager = StateManager();
      stateManager.initializeState('counter', 0);

      var counterState = stateManager.getState('counter');
      expect(counterState?.state, 0);

      stateManager.updateState('counter', 5);
      counterState = stateManager.getState('counter');
      expect(counterState?.state, 5);
    });

    test('should reset state', () {
      final stateManager = StateManager();
      stateManager.initializeState('counter', 0);
      stateManager.updateState('counter', 10);

      stateManager.resetState('counter');
      final counterState = stateManager.getState('counter');
      expect(counterState?.state, 0);
    });

    test('should delete state', () {
      final stateManager = StateManager();
      stateManager.initializeState('counter', 0);

      stateManager.deleteState('counter');
      final counterState = stateManager.getState('counter');
      expect(counterState, null);
    });
  });
}
