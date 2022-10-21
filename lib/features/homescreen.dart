import 'package:adm_empresas/features/delete_screen.dart';
import 'package:adm_empresas/features/list_screen.dart';
import 'package:adm_empresas/features/registration_screen.dart';
import 'package:adm_empresas/features/search_screen.dart';
import 'package:adm_empresas/widgets/home_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Empresas'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeButton(
                    iconButton: Icons.add_box_outlined,
                    textButton: 'Cadastrar',
                    screen: const RegistrationScreen(),
                  ),
                  HomeButton(
                    iconButton: Icons.search,
                    textButton: 'Procurar',
                    screen: const SearchScreen(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeButton(
                    iconButton: Icons.list_alt,
                    textButton: 'Listar Empresas',
                    screen: const ListScreen(),
                  ),
                  HomeButton(
                    iconButton: Icons.delete_outline,
                    textButton: 'Deletar',
                    screen: const DeleteScreen(),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
