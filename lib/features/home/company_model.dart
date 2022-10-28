import 'dart:convert';

class CompanyModel {
  final String cnpj;
  final String razaoSocial;
  final String fantasia;
  final String logradouro;
  final String numero;
  final List<Cnae> cnaes;
  final String? id;

  CompanyModel(
    this.cnpj,
    this.razaoSocial,
    this.fantasia,
    this.logradouro,
    this.numero,
    this.cnaes, [
    this.id,
  ]);

  Map<String, dynamic> toMap() {
    return {
      'cnpj': cnpj,
      'razaoSocial': razaoSocial,
      'fantasia': fantasia,
      'logradouro': logradouro,
      'numero': numero,
      'cnaes': cnaes.map((x) => x.toMap()).toList(),
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    final model = CompanyModel(
      map['cnpj'] ?? '',
      map['razao_social'] ?? map['razaoSocial'],
      map['nome_fantasia'] ?? map['fantasia'],
      map['logradouro'] ?? '',
      map['numero'] ?? '',
      map['cnaes_secundarios'] != null
          ? List<Cnae>.from(
              map['cnaes_secundarios']?.map((x) => Cnae.fromMap(x)))
          : List<Cnae>.from(map['cnaes']?.map((x) => Cnae.fromMap(x))),
      map['_id'],
    );
    return model;
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));

  CompanyModel copyWith({
    String? cnpj,
    String? razaoSocial,
    String? fantasia,
    String? logradouro,
    String? numero,
    List<Cnae>? cnaes,
  }) {
    return CompanyModel(
      cnpj ?? this.cnpj,
      razaoSocial ?? this.razaoSocial,
      fantasia ?? this.fantasia,
      logradouro ?? this.logradouro,
      numero ?? this.numero,
      cnaes ?? this.cnaes,
    );
  }
}

class Cnae {
  final int codigo;
  final String descricao;

  Cnae(this.codigo, this.descricao);

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'descricao': descricao,
    };
  }

  factory Cnae.fromMap(Map<String, dynamic> map) {
    final cnae = Cnae(
      map['codigo']?.toInt() ?? 0,
      map['descricao'] ?? '',
    );
    return cnae;
  }

  String toJson() => json.encode(toMap());

  factory Cnae.fromJson(String source) => Cnae.fromMap(json.decode(source));
}
