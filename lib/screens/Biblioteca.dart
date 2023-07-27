import 'package:flutter/material.dart';

class Libary extends StatefulWidget {
  const Libary({super.key});

  @override
  State<Libary> createState() => _LibaryState();
}

class _LibaryState extends State<Libary> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Biblioteca"),
    );
  }
}
