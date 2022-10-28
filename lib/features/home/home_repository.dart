import 'dart:convert';

import 'package:adm_empresas/features/home/company_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRepository {
  Future<bool> createCompany(CompanyModel company);
  Future<List<CompanyModel>> getCompanies();
  Future<bool> deleteCompany(String id);
}

class HomeRepositoryHttp implements HomeRepository {
  final baseUrl = 'https://crudcrud.com/api/db320d11e2f248c1ac31886fb900d2a9';
  @override
  Future<bool> createCompany(CompanyModel company) async {
    final response = await http.post(
      Uri.parse('$baseUrl/companies'),
      body: company.toJson(),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    print(response.statusCode);
    return true;
  }

  @override
  Future<List<CompanyModel>> getCompanies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/companies'),
    );
    print(response.body);
    print(jsonDecode(response.body));
    print(List.from(jsonDecode(response.body)));
    final list = List.from(jsonDecode(response.body));
    final company = list.map((e) => CompanyModel.fromMap(e)).toList();
    return company;
  }

  @override
  Future<bool> deleteCompany(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/companies/$id'),
    );
    return response.statusCode == 200;
  }
}
