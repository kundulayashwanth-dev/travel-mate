// Travel Mate - Experiment 9(b): Display the fetched data in a
// meaningful way: one card per country with its capital and country codes.
//
// pubspec.yaml needs:   http: ^1.2.0
// Needs an internet connection.
// Run:  flutter run -t lib/experiments/exp09b_display_api_data.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ApiCardApp());
}

class ApiCardApp extends StatelessWidget {
  const ApiCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'REST API Example',
      debugShowCheckedModeBanner: false,
      home: CountryCardScreen(),
    );
  }
}

class CountryCardScreen extends StatefulWidget {
  const CountryCardScreen({super.key});

  @override
  State<CountryCardScreen> createState() => _CountryCardScreenState();
}

class _CountryCardScreenState extends State<CountryCardScreen> {
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
      appBar: AppBar(title: const Text("Destinations from API")),
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
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(child: Text(name[0])),
                        title: Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(capital.isEmpty
                                ? 'Capital: Not listed'
                                : 'Capital: $capital'),
                            Text("Country code: ${country['iso2'] ?? 'Not listed'}"),
                            Text("ISO code: ${country['iso3'] ?? 'Not listed'}"),
                          ],
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
    );
  }
}
