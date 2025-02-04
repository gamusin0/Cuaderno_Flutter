import 'package:alejandra_cuaderno4/screens/PantallaPrincipal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 100, 162, 237)),
        useMaterial3: true,
      ),
      home: const PantallaPrincipal(title: 'Pantalla Principal'),
    );
  }
}