import 'package:book/core/theme.dart';
import 'package:book/widgets/custom_text_field.dart';
import 'package:book/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _isbnController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descController = TextEditingController();
  final _quantityController = TextEditingController();

  bool _isLoading = false;

  void _addBook() async {
    setState(() => _isLoading = true);
    // Simulate upload delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Book added successfully!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: const Text('Add New Book'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Picker Placeholder
            GestureDetector(
              onTap: () {
                // Implement image picking
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, size: 40, color: AppTheme.primaryPurple),
                    SizedBox(height: 8),
                    Text('Upload Book Cover', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            CustomTextField(label: 'Title', hint: 'Enter book title', controller: _titleController),
            CustomTextField(label: 'Author', hint: 'Enter author name', controller: _authorController),
            
            // ISBN Row with Scanner Button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'ISBN',
                    hint: 'Scan or type ISBN',
                    controller: _isbnController,
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
                        // Launch Scanner
                      },
                    ),
                  ),
                ),
              ],
            ),
            
            CustomTextField(label: 'Category', hint: 'e.g. Science, Fiction', controller: _categoryController),
            CustomTextField(
              label: 'Quantity',
              hint: 'Number of copies',
              controller: _quantityController,
              keyboardType: TextInputType.number,
            ),
            
            // Multi-line Description
            const Text('Description', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter book description...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'Save Book',
              onPressed: _addBook,
              isLoading: _isLoading,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
