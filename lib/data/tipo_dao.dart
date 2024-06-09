import 'package:adotar_animais_app/data/classTipo.dart';

import 'database.dart';


class TipoDao {

  saveTipo(TipoClass note) async {
    print(note.descricao + 'Descraioaoaoaoaoa');
    final db = await DatabaseHelper().database;
    return await db.insert('tipo', note.toMap());
  }

Future<List<TipoClass>> findAll() async {
    print('Acessando o findAll');
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> result = await db.query('tipo');
    print('Procurando dados no BD... encontrado: $result');
    return toList(result);
  }

  

  Future<List<TipoClass>> FindTipo(String cpfTipo) async {
    print('Acessando find: ');
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> result = await db
        .query('tipo', where: 'cpf = ?', whereArgs: [cpfTipo]);
    var test = toList(result)[0].cpf;
    print('Tarefa encontrada: $test');
    
    return toList(result);
  }

  updateData(TipoClass note) async {
    var cpf = note.cpf;
    final db = await DatabaseHelper().database;
    return db.update('tipo', note.toMap(), where: 'cpf = $cpf');
  }

  delete(String nomeDaTarefa) async {
    print('Deletando tarefa: $nomeDaTarefa');
    final db = await DatabaseHelper().database;
    return db.delete('tipo', where: 'cpf = $nomeDaTarefa');
  }

  List<TipoClass> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List');
    final List<TipoClass> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final TipoClass tarefa = TipoClass(
          cpf: linha['cpf'],
          idCachorro: linha['idCachorro'],
          tipo: linha['tipo'],
          descricao: linha['descricao']);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  

}