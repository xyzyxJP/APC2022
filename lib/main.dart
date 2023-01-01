import 'dart:convert';

import 'package:apc2022/provider/settings.dart';
import 'package:apc2022/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({
    super.key,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    final Map<String, dynamic> ingredientList =
        prefs.getString('ingredientList') != null
            ? jsonDecode(prefs.getString('ingredientList')!)
            : {
                '酒': false,
                '醤油': false,
                'みりん': false,
                '砂糖': false,
                '酢': false,
                '味噌': false,
                '塩': false,
                '胡椒': false,
              };
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider(isDarkMode, ingredientList),
        ),
      ],
      child: Consumer<SettingsProvider>(
        builder: (context, settings, _) {
          return MaterialApp(
            title: 'APC2022',
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'Murecho',
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              fontFamily: 'Murecho',
              brightness: Brightness.dark,
            ),
            themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const HomePage(title: 'APC2022 Home Page'),
          );
        },
      ),
    );
  }
}
