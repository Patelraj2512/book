import 'package:book/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
        const SizedBox(height: 16),
        const Text(
          'John Doe',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Student ID: 19CS001',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 48),
        PrimaryButton(
          text: 'Logout',
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
