class AulaModel {
  String? agrupamento;
  String? id_posicao;
  String? nome;
  String? idVideo;
  String? tec;
  String? sub;
  String? nivel;
  String? observacoes;
  String? inicio;
  String? fim;
  String? passo;
  String? regiao;
  bool gi;
  int? reps;

  AulaModel({this.id_posicao = '', this.nome = '', this.idVideo  = "", this.tec = '1', this.sub  = "Outra", this.nivel ="Branca", this.observacoes = '', this.inicio = "0", this.fim = '0', this.passo = '', this.gi = true, this.reps = 0, this.agrupamento, this.regiao = 'br'});

  //convert post to Map
  Map<String, dynamic> toJson() => {
    'agrupamento': agrupamento == null ? null : agrupamento,
    'id_posicao': id_posicao == null ? null : id_posicao,
    'nome': nome == null ? null : nome,
    'idVideo': idVideo == null ? null :  idVideo,
    'tec': tec == null ? null : tec,
    'sub': sub == null ? null : sub,
    'regiao': regiao == null ? null : regiao,
    'nivel': nivel == null ? null : nivel,
    'observacoes': observacoes == null ? null : observacoes,
    'inicio': inicio == null ? null : inicio,
    'fim': fim == null ? null : fim,
    'passo': passo == null ? null : passo,
    'gi': gi == null ? null : gi,
    'reps': reps == null ? null : reps,


  };

  factory AulaModel.fromJson(Map<String, dynamic> json) {
    //print(json);
    
    return AulaModel(
      agrupamento: json["agrupamento"] == null ? null : json["agrupamento"],
      id_posicao: json["id_posicao"] == null ? null : json["id_posicao"],
      nome: json["nome"] == null ? null : json["nome"],
      idVideo: json["idVideo"] == null ? null : json["idVideo"],
      tec: json["tec"] == null ? null : json["tec"],
      sub: json["sub"] == null ? null : json["sub"],
      regiao: json["regiao"] == null ? null : json["regiao"],
      nivel: json["nivel"] == null ? null : json["nivel"],
      observacoes: json["observacoes"] == null ? null : json["observacoes"],
      inicio: json["inicio"] == null ? null : json["inicio"],
      fim: json["fim"] == null ? null : json["fim"],
      passo: json["passo"] == null ? null : json["passo"],
      gi: json["gi"] == null ? true : json["gi"] == 'true' ? true : json["gi"] == 'false' ? false : json["gi"] == true ? true : false,
      reps: json["reps"] == null ? 0 : json["reps"],
  );
  }

}

