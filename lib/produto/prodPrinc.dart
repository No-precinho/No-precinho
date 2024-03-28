import 'package:flutter/material.dart';

class prodClass extends StatefulWidget {
  String imgUrl = '';
  String title = '';
  String descricao = '';
  prodClass(this.imgUrl, this.title, this.descricao);

  @override
  _prodClass createState() => _prodClass(imgUrl, title, descricao);
}

class _prodClass extends State<prodClass> {
  String imgUrl = '';
  String title = '';
  String descricao = '';
  _prodClass(this.imgUrl, this.title, this.descricao);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              imgUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
