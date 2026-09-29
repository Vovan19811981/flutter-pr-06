import 'package:flutter/material.dart';

import '../models/counter_history_entry.dart';

class HistoryEntryTile extends StatelessWidget {
  const HistoryEntryTile({
    super.key,
    required this.entry,
  });

  final CounterHistoryEntry entry;

  String _twoDigits(int value) => value.toString().padLeft(2, '0');

  String _formatDateTime(DateTime value) {
    final String date = '${_twoDigits(value.day)}.${_twoDigits(value.month)}.${value.year}';
    final String time = '${_twoDigits(value.hour)}:${_twoDigits(value.minute)}:${_twoDigits(value.second)}';
    return '$date  $time';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(entry.action),
        ),
        title: Text('${entry.before} → ${entry.after}'),
        subtitle: Text(_formatDateTime(entry.time)),
      ),
    );
  }
}
