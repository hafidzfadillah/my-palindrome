import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/ui/first_screen.dart';
import 'package:suitmedia_test/ui/first_viewmodel.dart';
import 'package:suitmedia_test/ui/second_viewmodel.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => FirstViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => SecondViewmodel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2B637B)),
          useMaterial3: false,
        ),
        home: FirstScreen());
  }
}
