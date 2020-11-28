class ResultRua {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  ResultRua(
      {this.cep,
        this.logradouro,
        this.complemento,
        this.bairro,
        this.localidade,
        this.uf,
        this.ibge,
        this.gia,
        this.ddd,
        this.siafi});


  factory ResultRua.fromJson(Map<String, dynamic> json) => ResultRua(
    cep: json["cep"] == null ? null : json["cep"],
    logradouro: json["logradouro"] == null ? null : json["logradouro"],
    complemento: json["complemento"] == null ? null : json["complemento"],
    bairro: json["bairro"] == null ? null : json["bairro"],
    localidade: json["localidade"] == null ? null : json["localidade"],
    uf: json["uf"] == null ? null : json["uf"],
    ibge: json["ibge"] == null ? null : json["ibge"],
    gia: json["gia"] == null ? null : json["gia"],
  );


  Map<String, dynamic> toJson(String body) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['localidade'] = this.localidade;
    data['uf'] = this.uf;
    data['ibge'] = this.ibge;
    data['gia'] = this.gia;
    data['ddd'] = this.ddd;
    data['siafi'] = this.siafi;
    return data;
  }
}