import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'busca_cep.dart';
import 'busca_ruas_cidades.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu CEP'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buttonBuscaCep()
          ],
        ),
      ),
    );
  }

  Widget _buttonBuscaCep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on, size: 80.0, color: Colors.pink,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RaisedButton(
                      onPressed:  () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PageCep()),
                        );
                      },
                      child: _loading ? _circularLoading() : Text('Consultar CEP'),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    RaisedButton(
                      onPressed:  () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BuscaRuas()),
                        );
                      },
                      child: _loading ? _circularLoading() : Text('Consultar RUAS'),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
              ],
          ),
        ],
    );
  }

  Widget _circularLoading() {
    return Container(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }
}
