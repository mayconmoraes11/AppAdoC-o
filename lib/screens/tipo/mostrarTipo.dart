
import 'package:adotar_animais_app/data/classTipo.dart';
import 'package:adotar_animais_app/data/tipo_dao.dart';
import 'package:adotar_animais_app/screens/tipo/crudTipo.dart';
import 'package:adotar_animais_app/screens/tipo/updateTipo.dart';
import 'package:flutter/material.dart';

class mostrarTipo extends StatefulWidget {
  List<TipoClass>? tipo;
  mostrarTipo({super.key, required this.tipo});

  @override
  State<mostrarTipo> createState() => _mostrarTipoState();
}

class _mostrarTipoState extends State<mostrarTipo> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text('Tipo'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                height: screenHeight/6,
                width: screenWidth/2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('cpf' + widget.tipo![0].cpf),
                        ElevatedButton(onPressed: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => updateTipo(tipo: widget.tipo,)));
                        }, child: Text('Update')),
                        ElevatedButton(onPressed: (){
                          TipoDao().delete(widget.tipo![0].cpf);
                          Navigator.of(context).pop();
                        }, child: Text('Delete'))
                      ],
                    ),
                    Text('idCachorro: ' + widget.tipo![0].idCachorro),
                    Text('Tipo: ' + widget.tipo![0].tipo),
                    Text('Descrição : '  + widget.tipo![0].descricao),
                  ],
                ),
                
              ),
            ],
          ),
        ),
    );
  }
}