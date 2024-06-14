import 'package:flutter/material.dart';
import './cam/pgCam.dart';
import './perfil/perfil.dart';
import './inicial/searchBar.dart';
import 'package:firebase_database/firebase_database.dart';
import './inicial/ProdInterface.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StepFormState();
  }
}

class StepFormState extends State<StepForm> {
  void addUserToDatabase() async {
    print("Entrei");
    final usersRef = FirebaseDatabase.instance.ref().child('products');
    print("Entrei2");
    final newUserRef = usersRef.get();

    /*

    DatabaseReference ref = FirebaseDatabase.instance.ref("products/4");

    await ref.set({
      "name": "Iogurte Grego Natural",
      "image": "https://www.sondadelivery.com.br/img.aspx/sku/1000040209/530/7896051165712.png",
      "category": "Frios e laticínios",
    });

    DatabaseReference q = FirebaseDatabase.instance.ref("products/3");

    await q.set({
      "name": "Heineken_330ml",
      "image": "https://cdn.awsli.com.br/2500x2500/2371/2371659/produto/169355378/304ad436dd.jpg",
      "category": "Adega e bebidas",
    });

    DatabaseReference e = FirebaseDatabase.instance.ref("products/2");

    await e.set({
      "name": "Queijo Gorgonzola",
      "image": "https://io.convertiez.com.br/m/superpaguemenos/shop/products/images/18865/medium/queijo-gorgonzola-tirolez-kg_76422.png",
      "category": "Frios e laticínios",
    });

    DatabaseReference w = FirebaseDatabase.instance.ref("products/1");

    await w.set({
      "name": "Pão Francês",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeMdlRz59OMciIJhtU6ivF7GINbN1cIZncWCGmfDrYiA&s",
      "category": "Padaria e confeitaria",
    });
*/
/*
    DatabaseReference ref = FirebaseDatabase.instance.ref("products/-Nx5ssRSbEEapxoszXHO");

    await ref.update({
      "name": "Presunto Parma",
    });
    print("Foi3");*/
/*
    await newUserRef
        .set({
          "name": "Heineken_330ml",
          "image":
              "https://cdn.awsli.com.br/2500x2500/2371/2371659/produto/169355378/304ad436dd.jpg"
        })
        .then((_) {})
        .catchError((error) {
          print('Erro ao adicionar usuário: $error');
        });*/
  }

  String _cidade = 'Belo Horizonte';
  int _opc = 0;
  final _ctrl = PageController();

  final List _pageList = [
    Inc(),
    BarcodeScannerPage(),
    perButtons(),
  ];

  void Pages(page) {
    if (page == 0) {
      _ctrl.animateToPage(0,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      //_ctrl.jumpToPage(0);
      //_ctrl.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInBack);
    }
    if (page == 1) {
      //_ctrl.jumpTo_(1);
      _ctrl.animateToPage(1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
    if (page == 2) {
      //_ctrl.jumpToPage(2);
      _ctrl.animateToPage(2,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                _cidade,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              onSelected: (String newValue) {
                setState(() {
                  _cidade = newValue;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Belo Horizonte',
                  child: Text('Belo Horizonte'),
                ),
                const PopupMenuItem<String>(
                  value: 'Betim',
                  child: Text('Betim'),
                ),
                const PopupMenuItem<String>(
                  value: 'Contagem',
                  child: Text('Contagem'),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: const Color(0xFFC70C65),
      ),
      body: PageView.builder(
          itemCount: _pageList.length,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: _ctrl,
          //physics: const PageScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _pageList[index];
          }),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        //fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (opcao) {
          //addUserToDatabase();
          //itensRowc it = itensRowc();
          //it.adcomp();
          Pages(opcao);
          _opc = opcao;
          //(context as Element).markNeedsBuild();
          setState(() {
            _opc = opcao;
          });
        },
        currentIndex: _opc,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
