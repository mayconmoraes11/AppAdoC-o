import 'package:adotar_animais_app/data/classPessoa.dart';
import 'package:adotar_animais_app/data/pessoa_dao.dart';
import 'package:adotar_animais_app/screens/animal/crudAnimal.dart';
import 'package:adotar_animais_app/screens/pessoa/createPessoa.dart';
import 'package:adotar_animais_app/screens/pessoa/crudPessoa.dart';
import 'package:flutter/material.dart';

import 'tipo/crudTipo.dart';

// escrever st para criar um statefulwidget que sera o inicio da criação de uma tela
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  // utilizar o Scaffold para gerar uma tela onde já possui um layout basico
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      // parte superior da tela, onde podemos considerar como um header
      appBar: AppBar(
        //title é o titulo da parte superior do app
        title: Text('AdoCÃO'),
        //centralizar titulo
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Stack(
          children: [Text('A causa animal é uma questão urgente e necessita da nossa atenção e ação imediata. No Brasil, estima-se que existam cerca de 30 milhões de animais abandonados, sendo aproximadamente 10 milhões de gatos e 20 milhões de cachorros. Esses números são alarmantes e refletem a dura realidade enfrentada pelos animais de rua. Os cachorros de rua, em especial, sofrem com a falta de alimentação, abrigo e cuidados médicos, vivendo em condições precárias e muitas vezes sendo vítimas de maus-tratos e atropelamentos. / A falta de centros de zoonoses adequados nos grandes centros urbanos agrava ainda mais essa situação, já que não há infraestrutura suficiente para acolher e cuidar desses animais. Adotar um animal é um ato de amor que salva vidas. Ao adotar, você não só proporciona um lar e cuidados a um animal que precisa, mas também ajuda a reduzir a superpopulação nas ruas e a pressão sobre os abrigos e centros de zoonoses. Precisamos nos unir para criar um futuro melhor para os animais, incentivando a adoção responsável e pressionando por políticas públicas que fortaleçam a infraestrutura de acolhimento e cuidado animal. / A ADOÇÃO É UMA FORMA DE TRANSFORMAR A VIDA DE UM ANIMAL E TAMBÉM DE TORNAR A NOSSA VIDA MAIS COMPLETA E FELIZ. DÊ UMA CHANCE A UM AMIGO DE QUATRO PATAS E AJUDE A MUDAR ESSA REALIDADE. / Em tempos de tecnologia, a criação de um site dedicado à doação de cachorros é uma necessidade urgente, pois facilita o processo de adoção e aumenta as chances de encontrar lares amorosos para os animais abandonados.  / O site AdoCÃO portanto, surge como mais uma ferramenta para auxiliar a centralizar informações sobre cães disponíveis para adoção, e promover campanhas de conscientização sobre a importância da adoção responsável. Além disso, a plataforma pode atuar como um elo entre abrigos, protetores independentes e potenciais adotantes, tornando o processo mais eficiente e transparente. A nível local, o site AdoCÃO pode reduzir significativamente o número de animais nas ruas, diminuir a incidência de zoonoses e fortalecer a comunidade ao incentivar atos de compaixão e responsabilidade social.')],
        )
      ),
      drawer: Drawer(
        elevation: 5,
        backgroundColor: Colors.black,
        child: ListView(children: [
          Container(
            height: screenHeight / 6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://noticias.itapevi.sp.gov.br/wp-content/uploads/2020/01/PMIL2743.jpg', // URL da imagem
                ),
                fit: BoxFit
                    .fill, // Ajusta a imagem para cobrir todo o espaço disponível
              ),
            ),
          ),
          ListTile(
            textColor: Color.fromARGB(255, 15, 1, 208),
            iconColor: Color.fromARGB(255, 1, 98, 208),
            tileColor: Color.fromARGB(255, 0, 125, 141).withOpacity(0.2),
            leading: Icon(Icons.app_registration_outlined),
            title: Text("Cadastro de Pessoa"),
            subtitle: Text("Local para cadastrar, buscar e deletar"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CRUDPessoa()),
              );
            },
          ),
          ListTile(
            textColor: Color.fromARGB(255, 15, 1, 208),
            iconColor: Color.fromARGB(255, 1, 98, 208),
            tileColor: Color.fromARGB(255, 0, 125, 141).withOpacity(0.2),
            leading: Icon(Icons.app_registration_outlined),
            title: Text("Cadastro de Animal"),
            subtitle: Text("Local para cadastrar, buscar e deletar"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CRUDAnimal()),
              );
            },
          ),
          ListTile(
            textColor: Color.fromARGB(255, 208, 25, 1),
            iconColor: Color.fromARGB(255, 208, 49, 1),
            tileColor: Color.fromARGB(255, 141, 56, 0).withOpacity(0.2),
            leading: Icon(Icons.app_registration_outlined),
            title: Text("Adoção"),
            subtitle: Text("Local para adotar um animal ou colocar para adoção"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CRUDTipo()),
              );
            },
          ),
      ])),
    );
  }
}