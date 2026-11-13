// Experiment launcher: lists every experiment and opens it on tap.
//
// Run:  flutter run
//
// Each experiment is also a complete program in lib/experiments/ and can be
// run by itself, e.g.  flutter run -t lib/experiments/exp02a_widgets.dart

import 'package:flutter/material.dart';

import 'experiments/exp02a_widgets.dart' as exp2a;
import 'experiments/exp02b_layouts.dart' as exp2b;
import 'experiments/exp03a_responsive_ui.dart' as exp3a;
import 'experiments/exp03b_breakpoints.dart' as exp3b;
import 'experiments/exp04a_navigation.dart' as exp4a;
import 'experiments/exp04b_named_routes.dart' as exp4b;
import 'experiments/exp05a_stateless_stateful.dart' as exp5a;
import 'experiments/exp05b_provider.dart' as exp5b;
import 'experiments/exp06a_custom_widgets.dart' as exp6a;
import 'experiments/exp06b_themes.dart' as exp6b;
import 'experiments/exp07a_form.dart' as exp7a;
import 'experiments/exp07b_form_validation.dart' as exp7b;
import 'experiments/exp08a_animations.dart' as exp8a;
import 'experiments/exp08b_fade_slide.dart' as exp8b;
import 'experiments/exp09a_fetch_api.dart' as exp9a;
import 'experiments/exp09b_display_api_data.dart' as exp9b;
import 'experiments/exp10a_counter_app.dart' as exp10a;
import 'experiments/exp10b_debugging.dart' as exp10b;

void main() {
  runApp(const LabApp());
}

class Experiment {
  const Experiment(this.number, this.title, this.builder);

  final String number;
  final String title;
  final WidgetBuilder builder;
}

final List<Experiment> experiments = [
  Experiment('1b', 'Dart program: trip cost', (_) => const DartProgramScreen()),
  Experiment('2a', 'Welcome screen (widgets)', (_) => const exp2a.MyApp()),
  Experiment('2b', 'Travel layout: Row, Column, Stack',
      (_) => const exp2b.MyLayoutApp()),
  Experiment('3a', 'Responsive destinations (MediaQuery)',
      (_) => const exp3a.ResponsiveApp()),
  Experiment('3b', 'Breakpoints with LayoutBuilder',
      (_) => const exp3b.BreakpointApp()),
  Experiment('4a', 'Destinations to trip details (push/pop)',
      (_) => const exp4a.NavigationApp()),
  Experiment('4b', 'Home, Booking, Confirmed (named routes)', (_) => const exp4b.NamedRouteApp()),
  Experiment('5a', 'Travellers and fare (setState)',
      (_) => const exp5a.MyApp()),
  Experiment('5b', 'Seat booking with Provider',
      (_) => const exp5b.ProviderRoot()),
  Experiment('6a', 'Trip cards (custom widgets)', (_) => const exp6a.CustomWidgetApp()),
  Experiment('6b', 'Themes and custom styles', (_) => const exp6b.ThemeApp()),
  Experiment('7a', 'Traveller account form', (_) => const exp7a.FormApp()),
  Experiment('7b', 'Form validation and error handling',
      (_) => const exp7b.FormValidationApp()),
  Experiment('8a', 'Trip search animation',
      (_) => const exp8a.AnimationApp()),
  Experiment('8b', 'Ticket booked: Fade and Slide',
      (_) => const exp8b.AnimationApp()),
  Experiment('9a', 'Fetch countries from REST API', (_) => const exp9a.ApiApp()),
  Experiment('9b', 'Country cards from API data',
      (_) => const exp9b.ApiCardApp()),
  Experiment('10a', 'Trip counter (unit tested)',
      (_) => const exp10a.CounterApp()),
  Experiment('10b', 'Debugging example', (_) => const exp10b.MyDebugApp()),
];

class LabApp extends StatelessWidget {
  const LabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Travel Mate',
      debugShowCheckedModeBanner: false,
      home: ExperimentListScreen(),
    );
  }
}

class ExperimentListScreen extends StatelessWidget {
  const ExperimentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Mate')),
      body: ListView.separated(
        itemCount: experiments.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final experiment = experiments[index];
          return ListTile(
            leading: CircleAvatar(child: Text(experiment.number)),
            title: Text(experiment.title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ExperimentHost(child: experiment.builder(context)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Shows one experiment full screen, with a small button to return to the
/// experiment list.
class ExperimentHost extends StatelessWidget {
  const ExperimentHost({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        Positioned(
          left: 12,
          bottom: 12,
          child: SafeArea(
            child: FloatingActionButton.small(
              heroTag: null,
              tooltip: 'Back to experiment list',
              onPressed: () => Navigator.of(context).pop(),
              child: const Icon(Icons.list),
            ),
          ),
        ),
      ],
    );
  }
}

/// Experiment 1(b) is a console program, so this screen shows the same
/// result on screen. The program itself is
/// lib/experiments/exp01b_dart_program.dart.
class DartProgramScreen extends StatelessWidget {
  const DartProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int bus = 450, hotel = 1200;
    int sum = bus + hotel;

    return Scaffold(
      appBar: AppBar(title: const Text('Dart Program: Trip Cost')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Console output:'),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.black,
              child: Text(
                'Hello, World! Welcome to Travel Mate.\n'
                'The sum of $bus and $hotel is $sum\n'
                'Trip cost for bus ticket and hotel = Rs.$sum',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'monospace',
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'To run it in a terminal:\n'
              'dart run lib/experiments/exp01b_dart_program.dart',
            ),
          ],
        ),
      ),
    );
  }
}
