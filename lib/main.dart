import 'package:flutter/material.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Лічильник')),
        body: Center(
          child: Text('$_value', style: const TextStyle(fontSize: 48)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _value++),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
