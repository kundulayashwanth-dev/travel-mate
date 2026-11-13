// Travel Mate - Experiment 3(b): Media queries and breakpoints
// using LayoutBuilder.
//
// Run:  flutter run -d chrome -t lib/experiments/exp03b_breakpoints.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const BreakpointApp());
}

class BreakpointApp extends StatelessWidget {
  const BreakpointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Query & Breakpoints',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Travel - Responsive with Breakpoints'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Container(
                color: Colors.lightBlueAccent,
                child: const Center(
                  child: Text(
                    'Mobile View',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1200) {
              return Container(
                color: Colors.teal,
                child: const Center(
                  child: Text(
                    'Tablet View',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              );
            } else {
              return Container(
                color: Colors.deepPurple,
                child: const Center(
                  child: Text(
                    'Desktop View',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
