import 'package:flutter/material.dart';

import '../widgets/counter_actions.dart';
import '../widgets/counter_value_panel.dart';
import '../widgets/history_badge.dart';
import 'history_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build: CounterScreen');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Лічильник'),
        actions: <Widget>[
          HistoryBadge(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HistoryScreen(),
                ),
              );
            },
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const CounterValuePanel(),
                  const SizedBox(height: 24),
                  const CounterActions(),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HistoryScreen(),
                        ),
                      );
                    },
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
