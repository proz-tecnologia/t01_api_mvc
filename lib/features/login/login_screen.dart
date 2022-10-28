import 'package:flutter/material.dart';

import '../home/homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  Icon icon = const Icon(Icons.visibility_off);
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final heightscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Administrador de Empresas'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: heightscreen * 0.1,
              ),
              Image.asset(
                'assets/images/company.png',
                width: 50,
                height: 50,
              ),
              SizedBox(
                height: heightscreen * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email obrigatório';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != '123456') {
                      return 'Senha incorreta, utilize a senha 123456';
                    }
                    return null;
                  },
                  obscureText: obscure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (obscure) {
                            icon = const Icon(Icons.visibility_off);
                            obscure = false;
                          } else {
                            icon = const Icon(Icons.visibility);
                            obscure = true;
                          }
                        });
                      },
                      icon: icon,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen(),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.6, 50)),
                  child: const Text('LOGIN'),
                ),
              ),
              SizedBox(
                height: heightscreen * 0.1,
              ),
              Image.asset(
                'assets/images/folder.png',
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
