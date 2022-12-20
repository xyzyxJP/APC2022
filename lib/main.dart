import 'package:apc2022/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APC2022',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Murecho',
      ),
      home: const HomePage(title: 'APC2022 Home Page'),
    );
  }
}
