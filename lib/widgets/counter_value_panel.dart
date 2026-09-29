import 'package:flutter/material.dart';

import '../state/counter_scope.dart';

class CounterValuePanel extends StatelessWidget {
  const CounterValuePanel({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build: CounterValuePanel');
    final int value = CounterScope.of(context).value;

    return Card(
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
              '$value',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
