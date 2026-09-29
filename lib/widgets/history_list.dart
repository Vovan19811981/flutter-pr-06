import 'package:flutter/material.dart';

import '../models/counter_history_entry.dart';
import '../state/counter_scope.dart';
import 'history_entry_tile.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build: HistoryList');
    final List<CounterHistoryEntry> history = CounterScope.of(context).history;

    if (history.isEmpty) {
      return const Center(
        child: Text('Історія поки порожня.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 96),
      itemCount: history.length,
      itemBuilder: (BuildContext context, int index) {
        return HistoryEntryTile(entry: history[index]);
      },
    );
  }
}
