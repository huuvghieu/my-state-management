// lib/src/state_manager.dart
import 'dart:async';
import 'package:my_state_management/src/state_model.dart';

class StateManager {
  final Map<String, StateModel> _states = {};

  void initializeState<T>(String key, T initialValue) {
    if (_states.containsKey(key)) return;
    _states[key] = StateModel<T>(initialValue);
  }

  StateModel? getState(String key) {
    return _states[key] ;
  }

  Future<void> updateState<T>(String key, T newState) async {
    var state = _states[key];
    if (state != null) {
      await state.update(newState);
    }
  }

  void resetState(String key) {
    var state = _states[key];
    if (state != null) {
      state.reset();
    }
  }

  void deleteState(String key) {
    _states.remove(key);
  }

  void disposeState(String key) {
    _states[key]?.stateController.close();
    _states.remove(key);
  }
}
