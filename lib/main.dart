import 'package:flutter/material.dart';
import 'controllers/emission_controller.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatefulWidget {
  const MonApplication({super.key});

  @override
  State<MonApplication> createState() => _MonApplicationState();
}

class _MonApplicationState extends State<MonApplication> {
  final EmissionController _controller = EmissionController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming App – MVC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: HomePage(controller: _controller),
    );
  }
}
