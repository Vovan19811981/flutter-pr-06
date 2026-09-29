import 'package:flutter/widgets.dart';

import 'counter_state.dart';

class CounterScope extends InheritedNotifier<CounterState> {
  const CounterScope({
    super.key,
    required CounterState notifier,
    required Widget child,
  }) : super(notifier: notifier, child: child);

  static CounterState of(BuildContext context) {
    final CounterScope? scope =
        context.dependOnInheritedWidgetOfExactType<CounterScope>();
    assert(scope != null, 'CounterScope was not found in the widget tree.');
    return scope!.notifier!;
  }

  static CounterState read(BuildContext context) {
    final CounterScope? scope =
        context.getInheritedWidgetOfExactType<CounterScope>();
    assert(scope != null, 'CounterScope was not found in the widget tree.');
    return scope!.notifier!;
  }
}
