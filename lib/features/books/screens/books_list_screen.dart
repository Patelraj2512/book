import 'package:book/core/theme.dart';
import 'package:flutter/material.dart';

class BooksListScreen extends StatelessWidget {
  const BooksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-book');
        },
        backgroundColor: AppTheme.primaryPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search books by title, author, or ISBN',
                prefixIcon: const Icon(Icons.search, color: AppTheme.primaryPurple),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Category filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterChip('All', true),
                _buildFilterChip('Science', false),
                _buildFilterChip('Programming', false),
                _buildFilterChip('Fiction', false),
                _buildFilterChip('Business', false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Mock data
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: Container(
                      width: 60,
                      height: 80,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.image, color: Colors.grey),
                    ),
                    title: Text('Book Title $index', style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Author Name\nCategory'),
                    isThreeLine: true,
                    trailing: const Chip(
                      label: Text('Available', style: TextStyle(color: Colors.white, fontSize: 12)),
                      backgroundColor: Colors.green,
                    ),
                    onTap: () {
                      // Navigate to book details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) {},
        selectedColor: AppTheme.accentPurple,
        checkmarkColor: AppTheme.primaryPurple,
      ),
    );
  }
}
