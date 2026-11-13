// Travel Mate - Experiment 8(b): Different animations (Fade & Slide).
//
// Run:  flutter run -t lib/experiments/exp08b_fade_slide.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationApp());
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fade & Slide Animations',
      debugShowCheckedModeBanner: false,
      home: FadeSlideDemo(),
    );
  }
}

class FadeSlideDemo extends StatefulWidget {
  const FadeSlideDemo({super.key});

  @override
  State<FadeSlideDemo> createState() => _FadeSlideDemoState();
}

class _FadeSlideDemoState extends State<FadeSlideDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-2.0, 0.0), // starts off to the left
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _startAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel - Fade & Slide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                'Your ticket is booked!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.orange,
                child: const Icon(Icons.confirmation_number,
                    color: Colors.white, size: 50),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _startAnimation,
              child: const Text("Start Animation"),
            ),
          ],
        ),
      ),
    );
  }
}
