# Travel Mate ✈️

A Flutter mini-project demonstrating Dart and Flutter concepts through travel-themed experiments. The app launcher is in `lib/main.dart`; each experiment can also be run independently.

## Screenshots

Screenshots supplied with the project are stored in `screenshots/`.

### Core Flutter widgets and layouts

![Widgets](screenshots/exp02a_widgets.png)
![Layouts](screenshots/exp02b_layouts.png)

### Responsive layouts

![Responsive mobile](screenshots/exp03a_mobile.png)
![Responsive tablet](screenshots/exp03a_tablet.png)
![Responsive desktop](screenshots/exp03a_desktop.png)
![Breakpoint mobile](screenshots/exp03b_mobile.png)
![Breakpoint tablet](screenshots/exp03b_tablet.png)
![Breakpoint desktop](screenshots/exp03b_desktop.png)

### Navigation and booking

![Navigation first screen](screenshots/exp04a_first_screen.png)
![Navigation second screen](screenshots/exp04a_second_screen.png)
![Named routes home](screenshots/exp04b_home.png)
![Booking screen](screenshots/exp04b_booking.png)
![Booking confirmed](screenshots/exp04b_confirmed.png)

### State, custom widgets, and themes

![State before](screenshots/exp05a_before.png)
![State after](screenshots/exp05a_after.png)
![Provider before](screenshots/exp05b_before.png)
![Provider after](screenshots/exp05b_after.png)
![Provider dependencies](screenshots/exp05b_pubspec_pub_get.png)
![Custom widgets](screenshots/exp06a_custom_widgets.png)
![Custom widget button](screenshots/exp06a_button_pressed.png)
![Theme](screenshots/exp06b_theme.png)

### Forms and animations

![Form empty](screenshots/exp07a_form_empty.png)
![Form submitted](screenshots/exp07a_form_submitted.png)
![Required field errors](screenshots/exp07b_required_errors.png)
![Invalid email](screenshots/exp07b_invalid_email.png)
![Animated widget before](screenshots/exp08a_before.png)
![Animated widget after](screenshots/exp08a_after.png)
![Fade and slide before](screenshots/exp08b_before.png)
![Fade and slide after](screenshots/exp08b_after.png)

### API, tests, and debugging

![API country list](screenshots/exp09a_country_list.png)
![API initial error state](screenshots/exp09a_first_api_error.png)
![Country cards](screenshots/exp09b_country_cards.png)
![Counter start](screenshots/exp10a_counter_start.png)
![Counter after](screenshots/exp10a_counter_after.png)
![Unit tests passed](screenshots/exp10a_unit_tests_passed.png)
![Debug error screen](screenshots/exp10b_bug_error_screen.png)
![Debugging fixed](screenshots/exp10b_fixed.png)

## Features

- Experiment launcher and independent experiment entry points.
- Flutter widgets: Text, Image, Container, Row, Column, and Stack.
- Responsive UI using MediaQuery and LayoutBuilder.
- Navigation using Navigator and named routes.
- Local state using setState and shared state using Provider.
- Reusable custom widgets and app themes.
- Form input and validation.
- Implicit and explicit animations.
- REST API requests and country cards.
- Widget/unit tests and debugging/null-safety exercise.

## Tech Stack

- Flutter and Dart
- Provider `^6.1.2`
- http `^1.2.0`
- flutter_test

## Getting Started

Install Flutter and verify the setup:

```bash
flutter --version
flutter doctor
```

Clone the repository and install packages:

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

Run tests:

```bash
flutter test
```

Run an individual experiment:

```bash
flutter run -t lib/experiments/exp02a_widgets.dart
```

## Experiments

| Experiment | File | Topic |
|---|---|---|
| 1b | `exp01b_dart_program.dart` | Dart basics and trip cost |
| 2a | `exp02a_widgets.dart` | Basic widgets |
| 2b | `exp02b_layouts.dart` | Row, Column, Stack |
| 3a | `exp03a_responsive_ui.dart` | Responsive UI with MediaQuery |
| 3b | `exp03b_breakpoints.dart` | LayoutBuilder breakpoints |
| 4a | `exp04a_navigation.dart` | Navigator push/pop |
| 4b | `exp04b_named_routes.dart` | Named routes |
| 5a | `exp05a_stateless_stateful.dart` | Stateless/Stateful and setState |
| 5b | `exp05b_provider.dart` | Provider state management |
| 6a | `exp06a_custom_widgets.dart` | Custom widgets |
| 6b | `exp06b_themes.dart` | Themes and styling |
| 7a | `exp07a_form.dart` | Traveller form |
| 7b | `exp07b_form_validation.dart` | Form validation |
| 8a | `exp08a_animations.dart` | Implicit animations |
| 8b | `exp08b_fade_slide.dart` | Fade and slide transitions |
| 9a | `exp09a_fetch_api.dart` | Fetch REST API data |
| 9b | `exp09b_display_api_data.dart` | Display API data |
| 10a | `exp10a_counter_app.dart` and `test/widget_test.dart` | Counter and tests |
| 10b | `exp10b_debugging.dart` | Debugging and null safety |

Source files are in `lib/experiments/`.

## Code Snippets

### 1. Responsive layout

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

### 2. Navigation

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

### 3. Shared state with Provider

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

### 4. Form validation

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

### 5. API request

From `lib/experiments/exp09a_fetch_api.dart`:

```dart
final response = await http.get(
  Uri.parse('https://countriesnow.space/api/v0.1/countries/capital'),
);

if (response.statusCode == 200) {
  final data = json.decode(response.body) as Map<String, dynamic>;
  setState(() {
    countries = (data['data'] as List<dynamic>?) ?? [];
  });
}
```

## Dependencies

Declared in `pubspec.yaml`:

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

## API Note

The API experiments require an internet connection and use the public CountriesNow API. API availability may vary. For Android, ensure internet permission is declared in `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

## Project Structure

```text
travel-mate/
├── lib/
│   ├── main.dart
│   └── experiments/
├── screenshots/
├── test/
│   └── widget_test.dart
├── pubspec.yaml
└── README.md
```

## License

No license file was supplied. Add a LICENSE file if you intend to distribute the project under an open-source license.
