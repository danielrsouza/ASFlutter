import 'package:flutter/material.dart';
import 'package:search_cep/models/result_rua.dart';
import 'package:search_cep/services/via_cep_service.dart';

class BuscaRuas extends StatefulWidget {
  @override
  _BuscaRuasState createState() => _BuscaRuasState();
}

class _BuscaRuasState extends State<BuscaRuas> {
  var _ufController = TextEditingController();
  var _cidadeController = TextEditingController();
  var _ruaController = TextEditingController();
  bool _loading = false;
  String _result;
  ResultRua _retorno = new ResultRua();
  dynamic _controlaCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Ruas'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buscaRuas(_ufController, 'UF'),
            _buscaRuas(_cidadeController, 'Cidade'),
            _buscaRuas(_ruaController, 'Rua'),
            _buildSearchRua(),
            _controlaCard != false?_buildResultFormRua() :Text(''),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchRua() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        onPressed: _searchRua,
        child: _loading ? _circularLoading() : Text('Buscar Informações'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _circularLoading() {
    return Container(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }


  Widget _buscaRuas(controller, label) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(labelText: label),
      controller: controller,
    );
  }

  Future _searchRua() async {
    _searching(true);

    final uf = _ufController.text;
    final cidade = _cidadeController.text;
    final rua = _ruaController.text;

    final resultRua = await ViaCepService.fetchRua(uf: uf, city: cidade, rua: rua);
    print(resultRua); // Exibindo somente a localidade no terminal

    setState(() {
      _retorno = resultRua;
      _controlaCard = true;
    });

    _searching(false);
  }

  void _searching(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _loading = enable;
    });
  }

  Widget _buildResultFormRua() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text("CIDADE: "+_retorno.localidade ?? ''),
              Text("ENDEREÇO: "+_retorno.logradouro ?? ''),
              Text("BAIRRO: "+_retorno.bairro ?? ''),
              Text("UF: "+_retorno.uf ?? ''),
              Text("CEP: "+_retorno.cep ?? ''),
            ],
          ),
        ),
        // child: Text(_result ?? ''),

      ),
    );
  }
}

