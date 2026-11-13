// Travel Mate - Experiment 4(a): Navigation between screens using
// Navigator.push and Navigator.pop.
//
// Run:  flutter run -t lib/experiments/exp04a_navigation.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationApp());
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navigation Example',
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

// First screen: the list of destinations.
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen - Destinations")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.landscape, size: 60, color: Colors.orange),
            const Text('Ooty Hill Station', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text("Go to Second Screen (Trip Details)"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Second screen: details of the selected trip.
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen - Trip Details")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ooty Hill Station', style: TextStyle(fontSize: 22)),
            const Text('Price: Rs.4500   |   2 Days, 1 Night'),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text("Back to First Screen"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
