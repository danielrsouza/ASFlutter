import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_cep/models/result_cep.dart';
import 'package:search_cep/models/result_rua.dart';

class ViaCepService {

  // Consulta via CEP
  static Future<ResultCep> fetchCep({String cep}) async {
    final response = await http.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      return ResultCep.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }

  // Consulta dos endereços
  static Future<ResultRua> fetchRua({String uf, String city, String rua}) async {
    uf = uf.trim();
    city = city.trim();
    rua = rua.trim();

    final response2 = await http.get('https://viacep.com.br/ws/$uf/$city/$rua/json/');
    if (response2.statusCode == 200) {
      var novoResponse = jsonDecode(response2.body);
      print(novoResponse[0]);
      return ResultRua.fromJson(novoResponse[0]);
    }  else {
      throw Exception('Requisição inválida!');
    }
  }
}
