// Travel Mate - Experiment 2(b): Combined layouts using Row, Column
// and Stack.
//
// Run:  flutter run -t lib/experiments/exp02b_layouts.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const MyLayoutApp());
}

class MyLayoutApp extends StatelessWidget {
  const MyLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Travel: Row, Column and Stack'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Row: three travel categories side by side
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.flight, size: 40, color: Colors.blue),
                  Icon(Icons.hotel, size: 40, color: Colors.red),
                  Icon(Icons.directions_bus, size: 40, color: Colors.green),
                ],
              ),
              const SizedBox(height: 20),
              // Column: heading with a picture below it
              const Column(
                children: [
                  Text(
                    'Welcome to Travel Mate!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Icon(Icons.map, size: 100, color: Colors.brown),
                ],
              ),
              const SizedBox(height: 20),
              // Stack: an offer badge overlaid on a trip card
              Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.orange,
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(8),
                    child: const Text('Goa Package - Rs.8999'),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.purple,
                      alignment: Alignment.center,
                      child: const Text(
                        '20% OFF',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
