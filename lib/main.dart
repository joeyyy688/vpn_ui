import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:vpn_ui/pages/landingPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(
    savedThemeMode: savedThemeMode,
  ));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({Key? key, this.savedThemeMode}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'vpn_ui',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}