import 'package:apc2022/provider/settings.dart';
import 'package:apc2022/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider(),
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
