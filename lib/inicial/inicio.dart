import 'package:flutter/material.dart';
import './rowsInten.dart';

Widget pageIncs(String imgUrl, String title, String descricao) {
  List itensHome = [
    Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          //Linha: 1
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        linePage(imgUrl, title, descricao),
        Align(
          //Linha: 2
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        linePage(imgUrl, title, descricao),
        Align(
          //Linha: 3
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        linePage(imgUrl, title, descricao),
        Align(
          //Linha: 4
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        linePage(imgUrl, title, descricao),
        Align(
          //Linha: 5
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        linePage(imgUrl, title, descricao),
      ],
    ),
  ];
  return Scaffold(
    body: ListView.builder(
      itemCount: itensHome.length,
      //scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        //final item = itensHome[index];
        return itensHome[index];
        /*return ListTile(
          title: Text(itensHome[index]["titulo"]),
          subtitle: Text(itensHome[index]["descricao"]),
        );*/
      },
    ),
  );
}
