// Travel Mate - Experiment 2(a): Explore Flutter widgets
// (Text, Image, Container).
//
// Run:  flutter run -t lib/experiments/exp02a_widgets.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Travel Mate')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello, Welcome to Travel Mate!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
                width: 100,
                // If the image cannot be loaded, show a flight icon instead.
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.flight,
                  size: 100,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue,
                child: const Text(
                  'Trip of the Week: Goa, 3 Days - Rs.8999',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
