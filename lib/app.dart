import 'package:adm_empresas/features/splash/splashscreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff627C94),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff517494)),
        )),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff517494)),
      ),
      home: const SplashScreen(),
    );
  }
}
