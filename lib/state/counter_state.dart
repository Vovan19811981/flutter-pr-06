import 'package:flutter/foundation.dart';

import '../models/counter_history_entry.dart';

class CounterState extends ChangeNotifier {
  int _value = 0;
  final List<CounterHistoryEntry> _history = <CounterHistoryEntry>[];

  int get value => _value;
  List<CounterHistoryEntry> get history =>
      List<CounterHistoryEntry>.unmodifiable(_history);

  void increment(int step) {
    final int before = _value;
    _value += step;
    _recordChange(action: '+$step', before: before, after: _value);
    notifyListeners();
  }

  bool decrement(int step) {
    if (_value - step < 0) {
      return false;
    }

    final int before = _value;
    _value -= step;
    _recordChange(action: '-$step', before: before, after: _value);
    notifyListeners();
    return true;
  }

  void reset() {
    if (_value == 0) {
      return;
    }

    final int before = _value;
    _value = 0;
    _recordChange(action: 'Скидання', before: before, after: _value);
    notifyListeners();
  }

  void clearHistory() {
    if (_history.isEmpty) {
      return;
    }
    _history.clear();
    notifyListeners();
  }

  void _recordChange({
    required String action,
    required int before,
    required int after,
  }) {
    _history.insert(
      0,
      CounterHistoryEntry(
        time: DateTime.now(),
        action: action,
        before: before,
        after: after,
      ),
    );
  }
}
