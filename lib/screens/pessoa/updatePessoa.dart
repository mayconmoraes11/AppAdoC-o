import 'package:adotar_animais_app/data/classPessoa.dart';
import 'package:adotar_animais_app/data/pessoa_dao.dart';
import 'package:adotar_animais_app/screens/pessoa/crudPessoa.dart';
import 'package:flutter/material.dart';


class updatePessoa extends StatefulWidget {
  List<PessoaClass>? pessoa;
  updatePessoa({super.key, required this.pessoa});

  
  @override
  State<updatePessoa> createState() => _updatePessoaState();
}

class _updatePessoaState extends State<updatePessoa> {

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerCPF = TextEditingController();
  TextEditingController controllerTelefone = TextEditingController();
  TextEditingController controllerEndereco = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  void initState() {
    super.initState();
    initItem();
  }

  void didUpdateWidget(covariant updatePessoa oldWidget) {
    super.didUpdateWidget(oldWidget);
    initItem();
  }

  void initItem() {
    final cpf = widget.pessoa == null
        ? ''
        : widget.pessoa![0].cpf;
    final nome = widget.pessoa == null
        ? ''
        : widget.pessoa![0].nome;
    final telefone = widget.pessoa == null
        ? ''
        : widget.pessoa![0].telefone;
    final endereco = widget.pessoa == null
        ? ''
        : widget.pessoa![0].endereco;
    final email = widget.pessoa == null
        ? ''
        : widget.pessoa![0].email;
        
    setState(() {
      controllerCPF =
          TextEditingController(text: cpf);
      controllerNome = TextEditingController(text: nome);
      controllerTelefone = TextEditingController(text: telefone);
      controllerEndereco = TextEditingController(text: endereco);
      controllerEmail = TextEditingController(text: email);
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
          title: Text('Update Pessoa'),
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
                      controller: controllerCPF,
                      onTap: () {
                        controllerCPF.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'CPF'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o CPF corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerNome,
                      onTap: () {
                        controllerNome.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Nome'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o nome corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerTelefone,
                      onTap: () {
                        controllerTelefone.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Telefone'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o telefone corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerEndereco,
                      onTap: () {
                        controllerEndereco.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'Endereço'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o endereço corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      initialValue: null,
                      controller: controllerEmail,
                      onTap: () {
                        controllerEmail.text = '';
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.blue),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Colors.blue)),
                          labelText: 'E-mail'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o e-mail corretamente!';
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
                        PessoaClass newPessoa = PessoaClass(
                          nome: controllerNome.text, 
                          cpf: controllerCPF.text, 
                          telefone: controllerTelefone.text, 
                          endereco: controllerEndereco.text, 
                          email: controllerEmail.text);
                        PessoaDao().updateData(newPessoa);
                        print('Uptade2');
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => CRUDPessoa()),
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