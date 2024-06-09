import 'package:adotar_animais_app/data/classPessoa.dart';

import 'database.dart';


class PessoaDao {

  savePessoa(PessoaClass note) async {
    final db = await DatabaseHelper().database;
    return await db.insert('pessoa', note.toMap());
  }

Future<List<PessoaClass>> findAll() async {
    print('Acessando o findAll');
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> result = await db.query('pessoa');
    print('Procurando dados no BD... encontrado: $result');
    return toList(result);
  }

  

  Future<List<PessoaClass>?> find(String cpfPessoa) async {
    print('Acessando find: ');
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> result = await db
        .query('pessoa', where: 'cpf = ?', whereArgs: [cpfPessoa]);
    if (result.isEmpty){
      return null;
    }else{
      var test = toList(result)[0].cpf;
      print('Tarefa encontrada: $test');
    
      return toList(result);
    }
    
  }

  updateData(PessoaClass note) async {
    var cpf = note.cpf;
    final db = await DatabaseHelper().database;
    return db.update('pessoa', note.toMap(), where: 'cpf = $cpf');
  }

  delete(String nomeDaTarefa) async {
    print('Deletando tarefa: $nomeDaTarefa');
    final db = await DatabaseHelper().database;
    return db.delete('pessoa', where: 'cpf = $nomeDaTarefa');
  }

  List<PessoaClass> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List');
    final List<PessoaClass> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final PessoaClass tarefa = PessoaClass(
          nome: linha['nome'],
          cpf: linha['cpf'],
          telefone: linha['telefone'],
          endereco: linha['endereco'],
          email: linha['email']);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  

}