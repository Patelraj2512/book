import 'package:book/core/theme.dart';
import 'package:book/widgets/custom_text_field.dart';
import 'package:book/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    setState(() => _isLoading = true);
    // Simulate auth delay
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/home'); // Placeholder for dashboard
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              // App Logo or Icon
              const Center(
                child: Icon(Icons.menu_book, size: 80, color: AppTheme.primaryPurple),
              ),
              const SizedBox(height: 24),
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 8),
              Text(
                'Log in to your Litereasy account',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 48),
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                label: 'Password',
                hint: 'Enter your password',
                controller: _passwordController,
                isPassword: true,
                prefixIcon: Icons.lock_outline,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password logic
                  },
                  child: const Text('Forgot Password?', style: TextStyle(color: AppTheme.primaryPurple, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: 'Login',
                onPressed: _login,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('Register', style: TextStyle(color: AppTheme.primaryPurple, fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
