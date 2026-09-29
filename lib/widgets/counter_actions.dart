import 'package:flutter/material.dart';

import '../state/counter_scope.dart';

class CounterActions extends StatefulWidget {
  const CounterActions({super.key});

  @override
  State<CounterActions> createState() => _CounterActionsState();
}

class _CounterActionsState extends State<CounterActions> {
  int _step = 1;

  void _decrement() {
    final bool changed = CounterScope.read(context).decrement(_step);
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
    debugPrint('build: CounterActions');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
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
                onPressed: () => CounterScope.read(context).increment(_step),
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
          onPressed: () => CounterScope.read(context).reset(),
          icon: const Icon(Icons.restart_alt),
          label: const Text('Скинути'),
        ),
      ],
    );
  }
}
