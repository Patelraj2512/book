import 'package:book/core/theme.dart';
import 'package:book/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class FinesScreen extends StatelessWidget {
  const FinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          // Total Fines Card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.primaryPurple, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: AppTheme.primaryPurple.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))
              ],
            ),
            child: const Column(
              children: [
                Text('Total Due Fines', style: TextStyle(color: Colors.white70, fontSize: 16)),
                SizedBox(height: 8),
                Text('₹150.00', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text('Fine Details', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          
          // Fine Items
          _buildFineItem('Atomic Habits', 'Late by 3 days', 30.0, false),
          _buildFineItem('Clean Code', 'Late by 12 days', 120.0, false),
          const SizedBox(height: 24),
          
          Text('Payment History', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          _buildFineItem('Design Patterns', 'Paid on 12th Oct', 50.0, true),
          
          const SizedBox(height: 48),
          PrimaryButton(
            text: 'Pay Now (₹150)',
            onPressed: () {
              // Integrate Razorpay dummy logic
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFineItem(String book, String status, double amount, bool isPaid) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isPaid ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isPaid ? Icons.check_circle : Icons.warning,
            color: isPaid ? Colors.green : Colors.redAccent,
          ),
        ),
        title: Text(book, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(status),
        trailing: Text(
          '₹${amount.toStringAsFixed(0)}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isPaid ? Colors.green : Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

