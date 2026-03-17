import 'package:book/core/theme.dart';
import 'package:book/widgets/custom_text_field.dart';
import 'package:book/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _isAdmin = false;
  bool _isLoading = false;

  void _register() async {
    setState(() => _isLoading = true);
    // Simulate auth registration delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/home'); // Placeholder
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primaryPurple),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Create Account',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 8),
              Text(
                'Join the Litereasy library today',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              
              // Role Selection Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text('Student'),
                    selected: !_isAdmin,
                    onSelected: (val) => setState(() => _isAdmin = false),
                    selectedColor: AppTheme.accentPurple,
                    labelStyle: TextStyle(
                      color: !_isAdmin ? AppTheme.primaryPurple : Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ChoiceChip(
                    label: const Text('Admin'),
                    selected: _isAdmin,
                    onSelected: (val) => setState(() => _isAdmin = true),
                    selectedColor: AppTheme.accentPurple,
                    labelStyle: TextStyle(
                      color: _isAdmin ? AppTheme.primaryPurple : Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              CustomTextField(
                label: 'Full Name',
                hint: 'Enter your name',
                controller: _nameController,
                prefixIcon: Icons.person_outline,
              ),
              if (!_isAdmin) ...[
                CustomTextField(
                  label: 'Student ID',
                  hint: 'Enter your roll number',
                  controller: _studentIdController,
                  prefixIcon: Icons.badge_outlined,
                ),
              ],
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                label: 'Password',
                hint: 'Create a password',
                controller: _passwordController,
                isPassword: true,
                prefixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Register',
                onPressed: _register,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
