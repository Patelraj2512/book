import 'package:book/core/theme.dart';
import 'package:book/widgets/custom_text_field.dart';
import 'package:book/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class IssueBookScreen extends StatefulWidget {
  const IssueBookScreen({super.key});

  @override
  State<IssueBookScreen> createState() => _IssueBookScreenState();
}

class _IssueBookScreenState extends State<IssueBookScreen> {
  final _studentIdController = TextEditingController();
  final _bookIdController = TextEditingController();
  DateTime _dueDate = DateTime.now().add(const Duration(days: 14)); // Auto due date 14 days
  bool _isLoading = false;

  void _issueBook() async {
    setState(() => _isLoading = true);
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Book Issued Successfully!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: const Text('Issue Book'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.library_books, size: 80, color: AppTheme.primaryPurple),
            const SizedBox(height: 16),
            Text(
              'Issue to Student',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 32),
            
            // Scan / Enter Student ID
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Student ID',
                    hint: 'Scan or type ID',
                    controller: _studentIdController,
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      color: AppTheme.accentPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.qr_code_scanner, color: AppTheme.primaryPurple),
                      onPressed: () {
                        // Launch Scanner for Student Card
                      },
                    ),
                  ),
                ),
              ],
            ),
            
            // Scan / Enter Book ID
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Book ID / ISBN',
                    hint: 'Scan or type Book ID',
                    controller: _bookIdController,
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      color: AppTheme.accentPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.qr_code_scanner, color: AppTheme.primaryPurple),
                      onPressed: () {
                        // Launch Scanner for Book Barcode
                      },
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Auto Calculated Due Date Display
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Calculated Due Date:', style: TextStyle(fontWeight: FontWeight.w600)),
                  Text(
                    '${_dueDate.day}/${_dueDate.month}/${_dueDate.year}',
                    style: const TextStyle(color: AppTheme.primaryPurple, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'Confirm Issue',
              onPressed: _issueBook,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
