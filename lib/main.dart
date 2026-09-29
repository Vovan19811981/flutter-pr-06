import 'package:flutter/material.dart';

import 'models/counter_history_entry.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _value = 0;
  final List<CounterHistoryEntry> _history = <CounterHistoryEntry>[];

  void _change(int delta) {
    setState(() {
      final before = _value;
      _value = (_value + delta).clamp(0, 1 << 31).toInt();
      _history.insert(
        0,
        CounterHistoryEntry(
          time: DateTime.now(),
          action: delta > 0 ? '+1' : '-1',
          before: before,
          after: _value,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Історія: ${_history.length}')),
        body: Center(child: Text('$_value', style: const TextStyle(fontSize: 48))),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(onPressed: () => _change(-1), child: const Icon(Icons.remove)),
            const SizedBox(width: 12),
            FloatingActionButton(onPressed: () => _change(1), child: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
