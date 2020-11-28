import 'package:flutter/material.dart';
import 'package:search_cep/views/busca_cep.dart';
import 'package:search_cep/views/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
  ));
}
