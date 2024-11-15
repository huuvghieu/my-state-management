// lib/src/async_state_example.dart
import 'dart:async';
import 'state_model.dart';

class AsyncStateModel extends StateModel<int> {
  AsyncStateModel(super.initialValue);

  @override
  // ignore: override_on_non_overriding_member
  int _initialState() => 0;

  Future<void> fetchDataFromAPI() async {
    await Future.delayed(const Duration(seconds: 2));
    await update(42); // Update state after API call
  }
}
