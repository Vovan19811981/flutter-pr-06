import 'package:flutter/material.dart';

class HistoryBadge extends StatelessWidget {
  const HistoryBadge({
    super.key,
    required this.count,
    this.onPressed,
  });

  final int count;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final Widget badge = Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        const Icon(Icons.history),
        Positioned(
          right: -10,
          top: -10,
          child: Container(
            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );

    if (onPressed == null) {
      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Center(child: badge),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: IconButton(
        tooltip: 'Історія',
        onPressed: onPressed,
        icon: badge,
      ),
    );
  }
}
