import 'package:flutter/material.dart';

import '../models/counter_history_entry.dart';
import '../widgets/history_badge.dart';
import '../widgets/history_entry_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
    required this.history,
    required this.onClearHistory,
  });

  static const String routeName = '/history';

  final List<CounterHistoryEntry> history;
  final VoidCallback onClearHistory;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  void _clearHistory() {
    if (widget.history.isEmpty) {
      return;
    }
    widget.onClearHistory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Історія змін'),
        actions: <Widget>[
          HistoryBadge(count: widget.history.length),
        ],
      ),
      body: widget.history.isEmpty
          ? const Center(
              child: Text('Історія поки порожня.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 96),
              itemCount: widget.history.length,
              itemBuilder: (BuildContext context, int index) {
                return HistoryEntryTile(entry: widget.history[index]);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: widget.history.isEmpty ? null : _clearHistory,
        icon: const Icon(Icons.delete_sweep_outlined),
        label: const Text('Очистити історію'),
      ),
    );
  }
}
