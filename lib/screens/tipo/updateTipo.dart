import 'package:adotar_animais_app/data/classTipo.dart';
import 'package:adotar_animais_app/data/tipo_dao.dart';
import 'package:adotar_animais_app/screens/tipo/crudTipo.dart';
import 'package:flutter/material.dart';


class updateTipo extends StatefulWidget {
  List<TipoClass>? tipo;
  updateTipo({super.key, required this.tipo});

  
  @override
  State<updateTipo> createState() => _updateTipoState();
}

class _updateTipoState extends State<updateTipo> {

  TextEditingController controllerCpf = TextEditingController();
  TextEditingController controllerIdCachorro = TextEditingController();
  TextEditingController controllerTipo = TextEditingController();
  TextEditingController controllerDescricao = TextEditingController();

  void initState() {
    super.initState();
    initItem();
  }

  void didUpdateWidget(covariant updateTipo oldWidget) {
    super.didUpdateWidget(oldWidget);
    initItem();
  }

  void initItem() {
    final cpf = widget.tipo == null
        ? ''
        : widget.tipo![0].cpf;
    final idCachorro = widget.tipo == null
        ? ''
        : widget.tipo![0].idCachorro;
    final tipo = widget.tipo == null
        ? ''
        : widget.tipo![0].tipo;
    final descricao = widget.tipo == null
        ? ''
        : widget.tipo![0].descricao;
        
    setState(() {
      controllerCpf = TextEditingController(text: cpf);
      controllerIdCachorro = TextEditingController(text: idCachorro);
      controllerTipo = TextEditingController(text: tipo);
      controllerDescricao = TextEditingController(text: descricao);
    });
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text('Update Tipo'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child:Padding(
            padding:
                EdgeInsets.only(top: (size.height) / 6, left: size.width / 12),
            child: Container(
              width: screenWidth / 1.2,
              height: screenHeight / 1.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.blue)),
              alignment: Alignment.center,
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerCpf,
                      onTap: () {
                        controllerCpf.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'cpf'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o cpf corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerIdCachorro,
                      onTap: () {
                        controllerIdCachorro.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'idCachorro'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o id corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerTipo,
                      onTap: () {
                        controllerTipo.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Tipo'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o tipo corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerDescricao,
                      onTap: () {
                        controllerDescricao.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Descrição'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe a descrição corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: SizedBox(
                        child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.update),
                          Padding(
                            padding: EdgeInsets.only(left: (0)),
                            child: Text(
                              'Update',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        print('Uptade');
                        TipoClass newAnimal = TipoClass(
                          cpf: controllerCpf.text,
                          idCachorro: controllerIdCachorro.text, 
                          tipo: controllerTipo.text, 
                          descricao: controllerDescricao.text,);
                        TipoDao().updateData(newAnimal);
                        print('Uptade2');
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => CRUDTipo()),
                            (Route<dynamic> route) => false);
                      },
                    )),
                  )

                ],
              ),
            ),
          ),
          
        ),
    );
  }
}