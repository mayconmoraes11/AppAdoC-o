import 'package:adotar_animais_app/data/classAnimal.dart';

import 'database.dart';


class AnimalDao {

  saveAnimal(AnimalClass note) async {
    final db = await DatabaseHelper().database;
    return await db.insert('animal', note.toMap());
  }

Future<List<AnimalClass>> findAll() async {
    print('Acessando o findAll');
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> result = await db.query('animal');
    print('Procurando dados no BD... encontrado: $result');
    return toList(result);
  }

  

  Future<List<AnimalClass>> find(String cpfAnimal) async {
    print('Acessando find: ');
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> result = await db
        .query('animal', where: 'cpf = ?', whereArgs: [cpfAnimal]);
    var test = toList(result)[0].cpf;
    print('Tarefa encontrada: $test');
    
    return toList(result);
  }

  updateData(AnimalClass note) async {
    var cpf = note.cpf;
    final db = await DatabaseHelper().database;
    return db.update('animal', note.toMap(), where: 'cpf = $cpf');
  }

  delete(String nomeDaTarefa) async {
    print('Deletando tarefa: $nomeDaTarefa');
    final db = await DatabaseHelper().database;
    return db.delete('animal', where: 'cpf = $nomeDaTarefa');
  }

  List<AnimalClass> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List');
    final List<AnimalClass> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final AnimalClass tarefa = AnimalClass(
          nome: linha['nome'],
          cpf: linha['cpf'],
          idade: linha['idade'],
          raca: linha['raca'],
          descricao: linha['descricao']);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  

}