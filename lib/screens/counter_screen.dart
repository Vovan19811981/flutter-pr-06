import 'package:flutter/material.dart';

import '../widgets/history_badge.dart';
import 'history_screen.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({
    super.key,
    required this.value,
    required this.historyCount,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
  });

  final int value;
  final int historyCount;
  final void Function(int step) onIncrement;
  final bool Function(int step) onDecrement;
  final VoidCallback onReset;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _step = 1;

  void _decrement() {
    final bool changed = widget.onDecrement(_step);
    if (!changed) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('Значення не може бути від’ємним.'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лічильник'),
        actions: <Widget>[
          HistoryBadge(
            count: widget.historyCount,
            onPressed: () => Navigator.of(context).pushNamed(HistoryScreen.routeName),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Поточне значення',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '${widget.value}',
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Крок зміни',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: <int>[1, 5, 10]
                        .map(
                          (int step) => ChoiceChip(
                            label: Text('$step'),
                            selected: _step == step,
                            onSelected: (_) => setState(() => _step = step),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () => widget.onIncrement(_step),
                          icon: const Icon(Icons.add),
                          label: const Text('Додати'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton.tonalIcon(
                          onPressed: _decrement,
                          icon: const Icon(Icons.remove),
                          label: const Text('Відняти'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: widget.onReset,
                    icon: const Icon(Icons.restart_alt),
                    label: const Text('Скинути'),
                  ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: () => Navigator.of(context).pushNamed(HistoryScreen.routeName),
                    icon: const Icon(Icons.history),
                    label: const Text('Відкрити історію'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
