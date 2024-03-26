import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class pgCam extends StatefulWidget {
  @override
  _pgCamState createState() => _pgCamState();
}

class _pgCamState extends State<pgCam> {
  @override
  Widget build(BuildContext context) {
    List _page2 = [
      const Column(
        children: <Widget>[
          //Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Text('Atualizar produto'),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
            ),
            onPressed: null,
            child: Icon(
              Icons.camera_sharp,
              size: 100,
              
            ),
          )
        ],
      )
    ];
    return Scaffold(
        body: ListView.builder(
      itemCount: _page2.length,
      itemBuilder: (context, index) {
        return _page2[index];
      },
    ));
  }
}
