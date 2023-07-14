import 'package:calculator/calculations.dart';
import 'package:calculator/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CalculationsProvider>(
      create: (_) => CalculationsProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: Provider.of<CalculationsProvider>(context).isDarkMode
          ? DarkTheme
          : lightTheme,
      home: const HomePage(),
    );
  }
}
