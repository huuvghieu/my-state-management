// lib/src/state_model.dart
import 'dart:async';

class StateModel<T> {
  T _state;
  final StreamController<T> _stateController = StreamController<T>.broadcast();

  StateModel(this._state);

  T get state => _state;

  // Stream<T> get stateStream => _stateController.stream;
  StreamController<T> get stateController => _stateController;

  void initialize(T newState) {
    _state = newState;
    _stateController.add(_state);
  }

  Future<void> update(T newState) async {
    _state = newState;
    _stateController.add(_state);
  }

  void reset() {
    _state = _initialState();
    _stateController.add(_state);
  }

  T _initialState() => _state;
}
