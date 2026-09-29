import 'package:flutter_test/flutter_test.dart';
import 'package:state_counter/state/counter_state.dart';

void main() {
  group('CounterState', () {
    test('increment changes value and adds a history entry', () {
      final CounterState state = CounterState();

      state.increment(5);

      expect(state.value, 5);
      expect(state.history, hasLength(1));
      expect(state.history.first.action, '+5');
      expect(state.history.first.before, 0);
      expect(state.history.first.after, 5);
    });

    test('decrement never allows a negative value', () {
      final CounterState state = CounterState();

      final bool changed = state.decrement(1);

      expect(changed, isFalse);
      expect(state.value, 0);
      expect(state.history, isEmpty);
    });

    test('reset and clearHistory update application state', () {
      final CounterState state = CounterState()..increment(10);

      state.reset();
      expect(state.value, 0);
      expect(state.history.first.action, 'Скидання');

      state.clearHistory();
      expect(state.history, isEmpty);
    });
  });
}
