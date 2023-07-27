import 'package:flutter/material.dart';
import 'package:test/Home.dart';

void main() {
  runApp(MaterialApp(
    home: const Home(),
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}
