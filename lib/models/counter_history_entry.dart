class CounterHistoryEntry {
  const CounterHistoryEntry({
    required this.time,
    required this.action,
    required this.before,
    required this.after,
  });

  final DateTime time;
  final String action;
  final int before;
  final int after;
}
