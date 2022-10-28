import 'package:adm_empresas/features/home/cnpj_repository.dart';
import 'package:adm_empresas/features/home/company_model.dart';
import 'package:adm_empresas/features/home/home_controller.dart';
import 'package:adm_empresas/features/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final cnpjController = TextEditingController();
  final razaoController = TextEditingController();
  final homeController =
      HomeController(CnpjRepositoryDio(), HomeRepositoryHttp());
  MaskInputFormatter cnpjMask = MaskInputFormatter(mask: '##.###.###/####-##');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                  ),
                  textInputAction: TextInputAction.send,
                  controller: cnpjController,
                  inputFormatters: [cnpjMask],
                  decoration: const InputDecoration(hintText: 'CNPJ'),
                  onFieldSubmitted: (value) async {
                    final company = await homeController.getCompany(value);
                    razaoController.text = company.razaoSocial;
                  },
                ),
                TextFormField(
                  controller: razaoController,
                  decoration: const InputDecoration(hintText: 'Razão Social'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    homeController.createCompany(CompanyModel(
                      cnpjController.text,
                      razaoController.text,
                      'fantasia',
                      'logradouro',
                      '1',
                      [Cnae(1, 'cnae1')],
                    ));
                  },
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
