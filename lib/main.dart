import 'package:book/core/router.dart';
import 'package:book/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart'; // Uncomment after running flutterfire configure

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase (Needs to be configured by user)
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    const ProviderScope(
      child: LitereasyApp(),
    ),
  );
}

class LitereasyApp extends StatelessWidget {
  const LitereasyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Litereasy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
