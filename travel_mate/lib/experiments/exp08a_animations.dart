// Travel Mate - Experiment 8(a): Animations with AnimatedContainer and
// AnimatedOpacity.
//
// Run:  flutter run -t lib/experiments/exp08a_animations.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animation Example',
      debugShowCheckedModeBanner: false,
      home: AnimationHome(),
    );
  }
}

class AnimationHome extends StatefulWidget {
  const AnimationHome({super.key});

  @override
  State<AnimationHome> createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome> {
  double boxSize = 100;
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel - Flutter Animations')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Blue box grows / shrinks
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: boxSize,
              height: boxSize,
              color: Colors.blue,
              curve: Curves.easeInOut,
              child: const Icon(Icons.flight_takeoff, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 20),
            // Text fades in and out
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: opacity,
              child: const Text(
                'Searching for trips...',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  boxSize = boxSize == 100 ? 200 : 100;
                  opacity = opacity == 1.0 ? 0.0 : 1.0;
                });
              },
              child: const Text("Animate"),
            ),
          ],
        ),
      ),
    );
  }
}
