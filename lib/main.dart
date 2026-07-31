import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/converter_cupertino.dart';
// import 'package:flutter_app/pages/converter_material.dart';
import './pages/converter_material.dart';
import './pages/app.dart';

void main() {
  runApp(const WeatherApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Currency Converter",
      home: ConverterMaterial(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(home: ConverterCupertino());
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      home: WeatherMainApp(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}
