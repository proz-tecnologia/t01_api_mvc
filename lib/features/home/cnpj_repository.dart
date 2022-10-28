import 'package:adm_empresas/features/home/company_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class CnpjRepository {
  Future<CompanyModel> getCompany(String cnpj);
}

class CnpjRepositoryHttp implements CnpjRepository {
  @override
  Future<CompanyModel> getCompany(String cnpj) async {
    final response = await http.get(
      Uri.http('brasilapi.com.br', '/api/cnpj/v1/$cnpj'),
    );
    print(response.body);
    final company = CompanyModel.fromJson(response.body);
    print(company);
    return company;
  }
}

class CnpjRepositoryDio implements CnpjRepository {
  @override
  Future<CompanyModel> getCompany(String cnpj) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://brasilapi.com.br/api',
      ),
    );
    final response = await dio.get('/cnpj/v1/$cnpj');
    print(response.data);
    final company = CompanyModel.fromMap(response.data);
    print(company);
    return company;
  }
}
