import 'package:flutter/material.dart';

import '../models/counter_history_entry.dart';
import '../screens/counter_screen.dart';
import '../screens/history_screen.dart';

class CounterAppShell extends StatefulWidget {
  const CounterAppShell({super.key});

  @override
  State<CounterAppShell> createState() => _CounterAppShellState();
}

class _CounterAppShellState extends State<CounterAppShell> {
  int _value = 0;
  final List<CounterHistoryEntry> _history = <CounterHistoryEntry>[];

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

  void _increment(int step) {
    setState(() {
      final int before = _value;
      _value += step;
      _recordChange(action: '+$step', before: before, after: _value);
    });
  }

  bool _decrement(int step) {
    if (_value - step < 0) {
      return false;
    }

    setState(() {
      final int before = _value;
      _value -= step;
      _recordChange(action: '-$step', before: before, after: _value);
    });
    return true;
  }

  void _reset() {
    if (_value == 0) {
      return;
    }

    setState(() {
      final int before = _value;
      _value = 0;
      _recordChange(action: 'Скидання', before: before, after: _value);
    });
  }

  void _clearHistory() {
    if (_history.isEmpty) {
      return;
    }
    setState(_history.clear);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Лічильник',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: CounterScreen(
        value: _value,
        historyCount: _history.length,
        onIncrement: _increment,
        onDecrement: _decrement,
        onReset: _reset,
      ),
      routes: <String, WidgetBuilder>{
        HistoryScreen.routeName: (BuildContext context) => HistoryScreen(
              history: _history,
              onClearHistory: _clearHistory,
            ),
      },
    );
  }
}
