// Travel Mate - Experiment 9(a): Fetch data from a REST API.
// Loads a list of countries and capitals from the CountriesNow public API.
//
// pubspec.yaml needs:   http: ^1.2.0
// Needs an internet connection.
// Run:  flutter run -t lib/experiments/exp09a_fetch_api.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ApiApp());
}

class ApiApp extends StatelessWidget {
  const ApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'REST API Example',
      debugShowCheckedModeBanner: false,
      home: CountryListScreen(),
    );
  }
}

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  List<dynamic> countries = [];
  String? error;

  Future<void> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(
          'https://countriesnow.space/api/v0.1/countries/capital'));
      if (!mounted) return;
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        setState(() {
          countries = (data['data'] as List<dynamic>?) ?? [];
          if (countries.isEmpty) error = 'No destinations found';
        });
      } else {
        setState(() {
          error = 'Failed to load destinations (status ${response.statusCode})';
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        error = 'Failed to load destinations: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fetch Data from API")),
      body: error != null
          ? Center(child: Text(error!))
          : countries.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    final country = countries[index];
                    final String name = country['name'] as String;
                    final String capital = (country['capital'] ?? '') as String;
                    return ListTile(
                      leading: CircleAvatar(child: Text(name[0])),
                      title: Text(name),
                      subtitle: Text(capital.isEmpty
                          ? 'Capital: Not listed'
                          : 'Capital: $capital'),
                    );
                  },
                ),
    );
  }
}
