// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'connectivity_service.dart';
import 'home_screen.dart';
import 'sign_in.dart';
import 'sign_up.dart';
import 'theme_provider.dart';

void main() {
  runApp(const MyApp());
  ConnectivityService.instance.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'FIRST',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.themeMode,
            home: const HomeScreen(),
            routes: {
              '/signin': (context) => SignIn(),
              '/signup': (context) => SignUp(),
            },
            scaffoldMessengerKey:
            ConnectivityService.instance.scaffoldMessengerKey,
          );
        },
      ),
    );
  }
}
