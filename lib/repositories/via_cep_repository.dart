import 'dart:convert';

import 'package:via_cep/models/via_cep_model.dart';
import 'package:http/http.dart' as http;
class ViaCepRepository{
  Future<ViaCepModel> cepSearch (String cep)async {

      var response = await http.get(Uri.parse("http://viacep.com.br/ws/$cep/json/"));

      if(response.statusCode == 200){
        var json = jsonDecode(response.body);
        return ViaCepModel.fromJson(json);
      }
      return ViaCepModel();
  }
}