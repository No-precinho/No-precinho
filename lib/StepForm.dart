import 'package:flutter/material.dart';
import './cam/pgCam.dart';
import './perfil/perfil.dart';
import './inicial/searchBar.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StepFormState();
  }
}

class StepFormState extends State<StepForm> {
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
        fixedColor: Colors.cyan,
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
