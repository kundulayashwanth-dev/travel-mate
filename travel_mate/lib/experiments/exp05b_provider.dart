// Travel Mate - Experiment 5(b): State management using provider.
// The number of booked seats is held in one ChangeNotifier shared by the whole app.
//
// pubspec.yaml needs:   provider: ^6.1.2
// Run:  flutter run -t lib/experiments/exp05b_provider.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// The shared (global) state: number of seats booked.
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

void main() {
  runApp(const ProviderRoot());
}

// Makes one Counter object available to every widget below it.
class ProviderRoot extends StatelessWidget {
  const ProviderRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Provider Example',
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // watch() rebuilds this widget whenever notifyListeners() is called.
    final counter = context.watch<Counter>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Booking (Provider)'),
        actions: [
          // The app bar reads the same Counter object as the body.
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Text('Seats: ${counter.count}')),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bus seat to Goa - Rs.450 each'),
            Text(
              'Seats booked: ${counter.count}',
              style: const TextStyle(fontSize: 24),
            ),
            Text('Total: Rs.${counter.count * 450}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
