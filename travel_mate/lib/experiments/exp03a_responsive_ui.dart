// Travel Mate - Experiment 3(a): Responsive UI using MediaQuery.
// The destination list changes its layout for mobile, tablet and desktop widths.
//
// Run:  flutter run -d chrome -t lib/experiments/exp03a_responsive_ui.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Destinations - Responsive UI'),
        ),
        body: const ResponsiveHomePage(),
      ),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Mobile
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone_android, size: 80, color: Colors.blue),
            const Text('Mobile Layout', style: TextStyle(fontSize: 24)),
            Text('Destinations in a single list (${screenWidth.toInt()} px)'),
          ],
        ),
      );
    } else if (screenWidth < 1200) {
      // Tablet
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.tablet_mac, size: 80, color: Colors.green),
            const SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tablet Layout', style: TextStyle(fontSize: 28)),
                Text('Destinations in 2 columns (${screenWidth.toInt()} px)'),
              ],
            ),
          ],
        ),
      );
    } else {
      // Desktop
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.desktop_windows, size: 80, color: Colors.purple),
            const SizedBox(width: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Desktop Layout', style: TextStyle(fontSize: 32)),
                Text('Destinations in 4 columns (${screenWidth.toInt()} px)'),
              ],
            ),
          ],
        ),
      );
    }
  }
}
