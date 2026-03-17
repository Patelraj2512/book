import 'package:flutter/material.dart';
import 'package:book/features/auth/screens/splash_screen.dart';
import 'package:book/features/auth/screens/login_screen.dart';
import 'package:book/features/auth/screens/register_screen.dart';
import 'package:book/features/dashboard/screens/home_screen.dart';
import 'package:book/features/books/screens/add_book_screen.dart';
import 'package:book/features/books/screens/book_details_screen.dart';
import 'package:book/features/issue/screens/issue_book_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/add-book':
        return MaterialPageRoute(builder: (_) => const AddBookScreen());
      case '/book-details':
        return MaterialPageRoute(builder: (_) => const BookDetailsScreen());
      case '/issue-book':
        return MaterialPageRoute(builder: (_) => const IssueBookScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
