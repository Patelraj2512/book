import 'package:book/core/theme.dart';
import 'package:book/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // In a real app, this would take a BookModel parameter
    final bool isAdmin = ModalRoute.of(context)?.settings.arguments as bool? ?? true;

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: const Text('Book Details'),
        actions: isAdmin
            ? [
                IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () {
                    // Show delete confirmation dialog
                  },
                ),
              ]
            : null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: const Icon(Icons.menu_book, size: 60, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Atomic Habits',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 8),
            Text(
              'James Clear',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoColumn('Category', 'Self-help'),
                _buildInfoColumn('Available', '3 / 10'),
                _buildInfoColumn('ISBN', '9780593189641'),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            const Text(
              'No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world\'s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.',
              style: TextStyle(height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 32),
            if (isAdmin)
              PrimaryButton(
                text: 'Issue Book to Student',
                onPressed: () {
                  // Navigate to specific issue flow
                },
              )
            else
              PrimaryButton(
                text: 'Reserve Book',
                onPressed: () {
                  // Reserve logic
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
