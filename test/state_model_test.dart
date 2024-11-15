// test/state_model_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_state_management/my_state_management.dart';

void main() {
  group('StateModel', () {
    test('should initialize and update complex state', () {
      final model = StateModel({'name': 'John'});
      expect(model.state, {'name': 'John'});

      model.update({'name': 'Jane'});
      expect(model.state, {'name': 'Jane'});
    });
  });
}
