import 'package:adm_empresas/features/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/company.png',
              width: 200,
              height: 200,
            ),
            Image.asset(
              'assets/images/folder.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: heightscreen * 0.1,
            ),
            const Text(
              "Administrador de Empresas",
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
