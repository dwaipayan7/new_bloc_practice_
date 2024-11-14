import 'package:flutter/material.dart';


Widget buildOnboardingContent(int index) {
  final content = [
    {'title': 'Welcome', 'description': 'This is the first page of onboarding'},
    {'title': 'Discover', 'description': 'Find interesting features on this page'},
    {'title': 'Get Started', 'description': 'You are all set to start using the app'},
  ];

  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(content[index]['title']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Text(content[index]['description']!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}