# Travel Mate ✈️

A Flutter learning project demonstrating Dart and Flutter fundamentals through **19 travel-themed experiments**. A launcher app in `lib/main.dart` lets you open each experiment, and individual experiments can also be run directly.

> **Source archive note:** The uploaded ZIP contained source code but no screenshot/image assets. The screenshot section below lists suggested captures and filenames; it does not claim screenshots are already present.

## Screenshots

Create a `screenshots/` directory and add captures from the running app using the suggested filenames:

```text
screenshots/
├── 01-experiment-launcher.png
├── 02-widgets.png
├── 03-layouts.png
├── 04-responsive-mobile.png
├── 05-responsive-tablet.png
├── 06-navigation.png
├── 07-provider-booking.png
├── 08-form-validation.png
├── 09-animations.png
├── 10-api-countries.png
└── 11-counter-tests.png
```

After adding the files, display them in this section with Markdown image syntax, for example:

```markdown
![Experiment launcher](screenshots/01-experiment-launcher.png)
![Widgets example](screenshots/02-widgets.png)
![Responsive mobile layout](screenshots/04-responsive-mobile.png)
```

**Capture guide:** Run the launcher, open each experiment, and capture the screen. Capture responsive UI at mobile and tablet/desktop widths. Wait for the country list to load before capturing the API experiment.

## Features

- Experiment launcher with navigation to each example.
- Flutter widgets and layout composition.
- Responsive layouts with `MediaQuery` and `LayoutBuilder`.
- Screen navigation with `Navigator.push/pop` and named routes.
- Local state with `setState` and shared state with Provider.
- Reusable custom widgets and app themes.
- Forms and input validation.
- Implicit and explicit animations.
- REST API requests and country data cards.
- Unit/widget tests and a null-safety debugging example.

## Tech Stack

- Flutter and Dart
- Provider `^6.1.2`
- http `^1.2.0`
- flutter_test

## Getting Started

### Requirements

Install the Flutter SDK and verify your setup:

```bash
flutter --version
flutter doctor
```

### Clone and run

```bash
git clone https://github.com/kundulayashwanth-dev/travel-mate.git
cd travel-mate
flutter pub get
flutter run
```

Run in Chrome:

```bash
flutter run -d chrome
```

Run the tests:

```bash
flutter test
```

Run one experiment directly:

```bash
flutter run -t lib/experiments/exp02a_widgets.dart
```

The uploaded source is a Flutter package tree. If platform folders such as `android/`, `ios/`, or `web/` are missing locally, generate the platform scaffolding with:

```bash
flutter create --project-name travel_mate .
flutter pub get
```

## Experiments

| Experiment | File | Concept |
|---|---|---|
| 1b | `exp01b_dart_program.dart` | Dart basics and trip-cost calculation |
| 2a | `exp02a_widgets.dart` | Text, Image, Container |
| 2b | `exp02b_layouts.dart` | Row, Column, Stack |
| 3a | `exp03a_responsive_ui.dart` | Responsive UI with MediaQuery |
| 3b | `exp03b_breakpoints.dart` | LayoutBuilder breakpoints |
| 4a | `exp04a_navigation.dart` | Navigator push/pop |
| 4b | `exp04b_named_routes.dart` | Named routes |
| 5a | `exp05a_stateless_stateful.dart` | StatelessWidget, StatefulWidget, setState |
| 5b | `exp05b_provider.dart` | Provider and ChangeNotifier |
| 6a | `exp06a_custom_widgets.dart` | Reusable custom widgets |
| 6b | `exp06b_themes.dart` | ThemeData and styling |
| 7a | `exp07a_form.dart` | Traveller form |
| 7b | `exp07b_form_validation.dart` | Form validation |
| 8a | `exp08a_animations.dart` | AnimatedContainer and AnimatedOpacity |
| 8b | `exp08b_fade_slide.dart` | FadeTransition and SlideTransition |
| 9a | `exp09a_fetch_api.dart` | Fetch data from a REST API |
| 9b | `exp09b_display_api_data.dart` | Display API data in cards |
| 10a | `exp10a_counter_app.dart` + `test/widget_test.dart` | Counter and widget tests |
| 10b | `exp10b_debugging.dart` | Debug output and null-safety |

All experiment source files are under `lib/experiments/`.

## Code Snippets

The following concise examples are adapted directly from the project source files.

### 1. Compose a Travel Mate screen

From `lib/experiments/exp02a_widgets.dart`:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text(
      'Hello, Welcome to Travel Mate!',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
)
```

### 2. Build a responsive layout

From `lib/experiments/exp03a_responsive_ui.dart`:

```dart
final screenWidth = MediaQuery.of(context).size.width;

if (screenWidth < 600) {
  return const Center(child: Text('Mobile Layout'));
} else if (screenWidth < 1200) {
  return const Center(child: Text('Tablet Layout'));
} else {
  return const Center(child: Text('Desktop Layout'));
}
```

### 3. Navigate between screens

From `lib/experiments/exp04a_navigation.dart`:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SecondScreen(),
  ),
);

// Return to the previous screen.
Navigator.pop(context);
```

### 4. Manage booking state with Provider

From `lib/experiments/exp05b_provider.dart`:

```dart
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

### 5. Validate a traveller's email

From `lib/experiments/exp07b_form_validation.dart`:

```dart
TextFormField(
  decoration: const InputDecoration(labelText: 'Email'),
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  },
)
```

### 6. Animate the trip search screen

From `lib/experiments/exp08a_animations.dart`:

```dart
AnimatedContainer(
  duration: const Duration(seconds: 1),
  width: boxSize,
  height: boxSize,
  color: Colors.blue,
  curve: Curves.easeInOut,
  child: const Icon(Icons.flight_takeoff, color: Colors.white),
)
```

### 7. Request country data from an API

From `lib/experiments/exp09a_fetch_api.dart`:

```dart
final response = await http.get(
  Uri.parse(
    'https://countriesnow.space/api/v0.1/countries/capital',
  ),
);

if (response.statusCode == 200) {
  final data = json.decode(response.body) as Map<String, dynamic>;
  setState(() {
    countries = (data['data'] as List<dynamic>?) ?? [];
  });
}
```

### 8. Test the counter model

From `test/widget_test.dart`:

```dart
test('increment() increases count by 1', () {
  final counter = CounterData();
  counter.increment();

  expect(counter.count, 1);
});
```

## Dependencies

The main dependencies are declared in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2
  http: ^1.2.0

dev_dependencies:
  flutter_test:
    sdk: flutter
```

## API and Internet Permission

Experiments 9a and 9b need an internet connection and call the CountriesNow public API. Results depend on that external service being available.

For Android builds, make sure internet permission is present in `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

## Tests

Run the tests with:

```bash
flutter test
```

The widget test file checks the counter's initial value, increment behavior, listener notifications, and the button interaction in the counter screen.

## Project Structure

```text
travel-mate/
├── lib/
│   ├── main.dart
│   └── experiments/
│       ├── exp01b_dart_program.dart
│       ├── exp02a_widgets.dart
│       ├── exp02b_layouts.dart
│       ├── ...
│       └── exp10b_debugging.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml
└── README.md
```

## License

No license file was included in the supplied archive. Add a `LICENSE` file if you plan to publish the project under a specific open-source license.
