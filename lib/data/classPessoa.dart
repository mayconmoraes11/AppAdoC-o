class PessoaClass {
  String nome = 'nome';
  String cpf = 'cpf';
  String telefone = 'telefone';
  String endereco = 'endereco';
  String email = 'email';

  PessoaClass(
      {required this.nome,
      required this.cpf,
      required this.telefone,
      required this.endereco,
      required this.email});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cpf': cpf,
      'telefone': telefone,
      'endereco': endereco,
      'email': email
    };
  }

  factory PessoaClass.fromMap(Map<String, dynamic> map) {
    return PessoaClass(
        nome: map['nome'],
        cpf: map['cpf'],
        telefone: map['telefone'],
        endereco: map['endereco'],
        email: map['email']);
  }
}
