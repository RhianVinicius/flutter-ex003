import 'package:flutter/material.dart';
import 'package:flutter_ex001/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build (BuildContext contex) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage()
    );
  }
}