// Travel Mate - Experiment 10(b): Use Flutter's debugging tools to
// identify and fix issues.
//
// Run:  flutter run -t lib/experiments/exp10b_debugging.dart
// Watch the console: debugPrint() shows "name = null".
//
// The bug: the passenger name is null. Writing Text(name!) crashes with
// "Null check operator used on a null value".
// The fix: name ?? "Default Name".

import 'package:flutter/material.dart';

void main() => runApp(const MyDebugApp());

class MyDebugApp extends StatelessWidget {
  const MyDebugApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debugging Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Debugging Example")),
        body: const Center(
          child: BuggyWidget(),
        ),
      ),
    );
  }
}

class BuggyWidget extends StatelessWidget {
  const BuggyWidget({super.key});

  // Stands in for a passenger name that failed to load.
  String? _loadPassengerName() => null;

  @override
  Widget build(BuildContext context) {
    // Intentional bug: null value
    String? name = _loadPassengerName();

    debugPrint("Debugging BuggyWidget, name = $name");

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Passenger:'),
        Text(
          name ?? "Default Name", // fix applied: no crash when name is null
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
