// Travel Mate - Experiment 5(a): Stateless vs Stateful widgets and
// state management with setState().
//
// Run:  flutter run -t lib/experiments/exp05a_stateless_stateful.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless vs Stateful',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Stateless vs Stateful')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyStatelessWidget(),
              SizedBox(height: 20),
              CounterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

// Stateless widget: the ticket name and fare never change.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('I am a Stateless Widget!', style: TextStyle(fontSize: 20)),
        Text('Bus ticket to Mysore - Rs.300 each'),
      ],
    );
  }
}

// Stateful widget: the number of travellers changes when the button is pressed.
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Travellers: $_counter',
          style: const TextStyle(fontSize: 20),
        ),
        Text('Fare: Rs.${_counter * 300}'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _increment,
          child: const Text("Increment"),
        ),
      ],
    );
  }
}
