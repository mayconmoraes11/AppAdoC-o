class TipoClass {
  String cpf = 'cpf';
  String idCachorro = 'idCachorro';
  String tipo = 'tipo';
  String descricao = 'descricao';

  TipoClass(
      {
      required this.cpf,
      required this.idCachorro,
      required this.tipo,
      required this.descricao
      });

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'idCachorro': idCachorro,
      'tipo': tipo,
      'descricao': descricao,
    };
  }

  factory TipoClass.fromMap(Map<String, dynamic> map) {
    return TipoClass(
        cpf: map ['cpf'],
        idCachorro: map['idCachorro'],
        tipo: map['tipo'],
        descricao: map['descricao']);
  }
}