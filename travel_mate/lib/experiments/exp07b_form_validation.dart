// Travel Mate - Experiment 7(b): Form validation and error handling.
//
// Run:  flutter run -t lib/experiments/exp07b_form_validation.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const FormValidationApp());
}

class FormValidationApp extends StatelessWidget {
  const FormValidationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Traveller Account - Validation')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: ValidatedForm(),
        ),
      ),
    );
  }
}

class ValidatedForm extends StatefulWidget {
  const ValidatedForm({super.key});

  @override
  State<ValidatedForm> createState() => _ValidatedFormState();
}

class _ValidatedFormState extends State<ValidatedForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            onSaved: (value) => name = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email is required';
              }
              if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
            onSaved: (value) => email = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            onSaved: (value) => password = value,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Account created for $name')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
