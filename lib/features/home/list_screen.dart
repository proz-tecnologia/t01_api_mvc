import 'package:adm_empresas/features/home/cnpj_repository.dart';
import 'package:adm_empresas/features/home/home_controller.dart';
import 'package:adm_empresas/features/home/home_repository.dart';
import 'package:flutter/material.dart';

import 'company_model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final controller = HomeController(CnpjRepositoryDio(), HomeRepositoryHttp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<CompanyModel>>(
        future: controller.getCompanies(),
        builder: (context, snapshot) {
          if (snapshot.data == null && !snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            const Center(
              child: Text('Ops, deu ruim'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final company = snapshot.data?[index];
              return ListTile(
                title: Text(company?.razaoSocial ?? ''),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    final result = await controller.deleteCompany(company!.id!);
                    if (result) {
                      setState(() {});
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
