import 'package:flutter/material.dart';
import './inicial/inicio.dart';
import './cam/pgCam.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {
  String _cidade = 'Belzonte v';
  int _opc = 0;
  final _ctrl = PageController();

  final List _pageList = [
    pageIncs(
        'https://image.cdn2.seaart.ai/2024-03-01/cnh3ec5e878c738rbgf0/ba8d5cc37c75f4d301038456f9fe21a4468e7662_high.webp',
        'Bebidas',
        '7,39 R\$ \nHeineken_330ml'),
    pgCam(),
    const Text('Perfil')
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

  void atzPage() {
    //_opc = _ctrl.position as int;
    print('test:');
    print(_ctrl.position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _cidade,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFC70C65),
      ),
      //
      body: PageView.builder(
          itemCount: _pageList.length,
          //physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: _ctrl,
          physics: const PageScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            //atzPage();
            return _pageList[index];
          }),

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color.fromARGB(255, 12, 220, 67),
        //fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF6D0CB9),
        onTap: (opcao) {
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
            label: String.fromEnvironment('home'),

            //label: Text(data),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: String.fromEnvironment('photo_camera'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: String.fromEnvironment('person'),
          ),
        ],
      ),
    );
  }
}
