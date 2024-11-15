// test/async_state_example_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_state_management/my_state_management.dart';

void main() {
  test('Async state should update after API call', () async {
    final asyncState = AsyncStateModel(0);

    expect(asyncState.state, 0);

    await asyncState.fetchDataFromAPI();

    expect(asyncState.state, 42);
  });
}
