class AnimalClass {
  String nome = 'nome';
  String cpf = 'cpf';
  String idade = 'idade';
  String raca = 'raca';
  String descricao = 'descricao';

  AnimalClass(
      {required this.nome,
      required this.cpf,
      required this.idade,
      required this.raca,
      required this.descricao});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cpf': cpf,
      'idade': idade,
      'raca': raca,
      'descricao': descricao
    };
  }

  factory AnimalClass.fromMap(Map<String, dynamic> map) {
    return AnimalClass(
        nome: map['nome'],
        cpf: map['cpf'],
        idade: map['idade'],
        raca: map['raca'],
        descricao: map['descricao']);
  }
}