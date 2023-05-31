import 'package:flutter/material.dart';
import 'package:via_cep/models/via_cep_model.dart';
import 'package:via_cep/repositories/via_cep_repository.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ViaCepModel _viaCepModel = new ViaCepModel();
  final ViaCepRepository _viaCepRepository = new ViaCepRepository();
  bool _loading = false;

  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Página inicial"),
        ),
        backgroundColor: const Color(0xFFEDEEE1),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children:[ Column(
              children: [
                const Text("Consulta de CEP", style: TextStyle(
                    fontSize: 30)),
                const SizedBox(height: 20),
                TextField(
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  controller: _cepController,
                  onChanged: (String value) async{
                    var cep = value.replaceAll(new RegExp(r'[^0-9]'), "");
                    setState(() {
                      _loading = true;
                    });
                    _viaCepModel = await _viaCepRepository.cepSearch(cep);
                    setState(() {
                    _loading = false;
                    });}),
                const SizedBox(height: 30),
                Text(_viaCepModel.logradouro ?? "Insira um endereço", style: const TextStyle(fontSize: 30),),
                const SizedBox(height: 30),
                Text("${_viaCepModel.localidade ?? ""} - ${_viaCepModel.uf ?? ""}", style: const TextStyle(fontSize: 30)),
                Visibility(visible: _loading ,child: const CircularProgressIndicator())
              ],
            ),
          ]),
        ),
      ),
    );
  }

}
