// Travel Mate - Experiment 6(a): Custom widgets for specific UI elements.
// CustomButton and CustomCard are reused for every trip package.
//
// Run:  flutter run -t lib/experiments/exp06a_custom_widgets.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const CustomWidgetApp());
}

class CustomWidgetApp extends StatelessWidget {
  const CustomWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widgets Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Widgets')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) => CustomButton(
                  label: 'Click Me',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Book button pressed!')),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const CustomCard(
                title: 'Goa Beach Tour',
                description: '3 days with hotel and breakfast - Rs.8999',
              ),
              const CustomCard(
                title: 'Ooty Hill Station',
                description: '2 days with sightseeing - Rs.4500',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget 1: a styled, reusable button.
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}

// Custom widget 2: a card with a bold title and descriptive text.
class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
