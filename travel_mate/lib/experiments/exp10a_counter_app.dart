// Travel Mate - Experiment 10(a): Unit tests for UI components.
// A counter for the trips booked today. This file is the app under test;
// the tests are in test/widget_test.dart.
//
// Run the app:    flutter run -t lib/experiments/exp10a_counter_app.dart
// Run the tests:  flutter test

import 'package:flutter/material.dart';

class CounterData extends ChangeNotifier {
  int _count;

  CounterData() : _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple Counter App',
      debugShowCheckedModeBanner: false,
      home: CounterHomePage(),
    );
  }
}

class CounterHomePage extends StatefulWidget {
  const CounterHomePage({super.key});

  @override
  State<CounterHomePage> createState() => _CounterHomePageState();
}

class _CounterHomePageState extends State<CounterHomePage> {
  final CounterData _counter = CounterData();

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Trips booked today:',
            ),
            // Rebuilds whenever CounterData calls notifyListeners().
            ListenableBuilder(
              listenable: _counter,
              builder: (context, child) {
                return Text(
                  '${_counter.count}',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _counter.increment,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
