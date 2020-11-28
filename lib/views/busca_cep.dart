import 'package:flutter/material.dart';
import 'package:search_cep/services/via_cep_service.dart';

import '../models/result_cep.dart';

class PageCep extends StatefulWidget {
  @override
  _PageCepState createState() => _PageCepState();
}

class _PageCepState extends State<PageCep> {
  var _searchCepController = TextEditingController();
  bool _loading = false;
  bool _enableField = true;
  String _result;
  ResultCep _retorno = new ResultCep();
  dynamic _controlaCard = false;

  @override
  void dispose() {
    super.dispose();
    _searchCepController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar CEP'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildSearchCepTextField(),
            _buildSearchCepButton(),
            _controlaCard != false?_buildResultForm() :Text(''),

          ],
        ),
      ),
    );
  }

  Widget _buildSearchCepTextField() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(labelText: 'Cep'),
      controller: _searchCepController,
      enabled: _enableField,
    );
  }

  Widget _buildSearchCepButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        onPressed: _searchCep,
        child: _loading ? _circularLoading() : Text('Consultar Cep'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  void _searching(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _loading = enable;
      _enableField = !enable;
    });
  }

  Widget _circularLoading() {
    return Container(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }

  Future _searchCep() async {
    _searching(true);

    final cep = _searchCepController.text;

    final resultCep = await ViaCepService.fetchCep(cep: cep);
    print(resultCep.localidade); // Exibindo somente a localidade no terminal

    setState(() {
      _retorno = resultCep;
      _controlaCard = true;
    });

    _searching(false);
  }

  Widget _buildResultForm() {

    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text("CEP: "+_retorno.cep ?? '',),
              Text("CIDADE: "+_retorno.localidade ?? ''),
              Text("UF: "+_retorno.uf ?? ''),
            ],
          ),
        ),
        // child: Text(_result ?? ''),

      ),
    );
  }
}
