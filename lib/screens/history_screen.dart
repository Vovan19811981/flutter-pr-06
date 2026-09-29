import 'package:flutter/material.dart';

import '../state/counter_scope.dart';
import '../widgets/history_badge.dart';
import '../widgets/history_list.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build: HistoryScreen');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Історія змін'),
        actions: const <Widget>[
          HistoryBadge(),
        ],
      ),
      body: const HistoryList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => CounterScope.read(context).clearHistory(),
        icon: const Icon(Icons.delete_sweep_outlined),
        label: const Text('Очистити історію'),
      ),
    );
  }
}
