import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './itenSel.dart';

Widget linePage(String imgUrl, String title, String descricao) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      //padding: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ForProd(imgUrl, title, descricao),
          ForProd(imgUrl, title, descricao),
          ForProd(imgUrl, title, descricao),
          ForProd(imgUrl, title, descricao),
          ForProd(imgUrl, title, descricao),
        ],
      ),
    ),
  );
}
