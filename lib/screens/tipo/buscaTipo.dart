import 'package:adotar_animais_app/screens/tipo/mostrarTipo.dart';
import 'package:flutter/material.dart';
import '../../components/textFromCrud.dart';
import '../../data/classTipo.dart';
import '../../data/tipo_dao.dart';

class buscaTipo extends StatefulWidget {
  const buscaTipo({super.key});

  @override
  State<buscaTipo> createState() => _buscaTipoState();
}

class _buscaTipoState extends State<buscaTipo> {
  final cpfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Tipo'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormCrud(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              item: cpfController,
              labelTexto: 'CPF',
              valueIsEmpty: 'Informe um CPF valido!',
              ),
              ElevatedButton(onPressed: () async {
                final TipoDao tipoDao = TipoDao();
                List<TipoClass> tipos = await tipoDao.FindTipo(cpfController.text);
                
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mostrarTipo(tipo : tipos)));
              }, 
              child: Text('Buscar'))
            ],
          ),
        ),
      ),
    );
  }
}