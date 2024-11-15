// lib/src/state_listener.dart
import 'package:flutter/material.dart';
import 'package:my_state_management/src/state_manager.dart';
import 'package:my_state_management/src/state_model.dart';

class StateListener<T> extends StatefulWidget {
  final String stateKey;
  final StateManager stateManager;
  final Widget Function(BuildContext context, T state) builder;

  const StateListener(
      {super.key,
      required this.stateKey,
      required this.builder,
      required this.stateManager});

  @override
  // ignore: library_private_types_in_public_api
  _StateListenerState<T> createState() => _StateListenerState<T>();
}

class _StateListenerState<T> extends State<StateListener<T>> {
  late Stream<T> _stateStream;
  late StateModel<T> _stateModel;

  @override
  void initState() {
    super.initState();
   final stateModel = widget.stateManager.getState(widget.stateKey);
    if (stateModel == null) {
      throw Exception(
          'StateManager does not contain a state with key "${widget.stateKey}" and type $T.');
    }

    _stateModel = stateModel as StateModel<T>;
    _stateStream = _stateModel.stateController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: _stateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.builder(context, snapshot.data!);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
