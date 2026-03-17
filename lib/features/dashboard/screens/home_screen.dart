import 'package:book/core/theme.dart';
import 'package:book/features/auth/screens/profile_screen.dart';
import 'package:book/features/books/screens/books_list_screen.dart';
import 'package:book/features/dashboard/screens/dashboard_tab.dart';
import 'package:book/features/fines/screens/fines_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const DashboardTab(),
    const BooksListScreen(),
    const FinesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: const Text('Litereasy'),
        elevation: 0,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppTheme.primaryPurple,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), activeIcon: Icon(Icons.dashboard), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), activeIcon: Icon(Icons.menu_book), label: 'Books'),
            BottomNavigationBarItem(icon: Icon(Icons.currency_rupee) , label: 'Fines'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

