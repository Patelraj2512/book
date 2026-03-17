import 'package:book/core/theme.dart';
import 'package:flutter/material.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        Text(
          'Overview',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
        ),
        const SizedBox(height: 16),
        // Stat Cards Row
        Row(
          children: [
            _buildStatCard(context, 'Books Issued', '3', Icons.menu_book),
            const SizedBox(width: 16),
            _buildStatCard(context, 'Fines Due', '₹0', Icons.currency_rupee),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Recent Activity',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        // Placeholder ListView
        Card(
          child: ListTile(
            leading: const CircleAvatar(backgroundColor: AppTheme.accentPurple, child: Icon(Icons.book, color: AppTheme.primaryPurple)),
            title: const Text('Atomic Habits'),
            subtitle: const Text('Due in 4 days'),
            trailing: const Text('Issued', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppTheme.primaryPurple, size: 28),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(color: Colors.black54, fontSize: 13)),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
