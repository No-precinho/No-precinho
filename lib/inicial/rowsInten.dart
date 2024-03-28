import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './itenSel.dart';

Widget linePage(String imgUrl, String title, String descricao) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          itenSel(imgUrl, title, descricao),
          itenSel(imgUrl, title, descricao),
          itenSel(imgUrl, title, descricao),
          itenSel(imgUrl, title, descricao),
          itenSel(imgUrl, title, descricao),
          itenSel(imgUrl, title, descricao),
        ],
      ),
    ),
  );

  /*Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        itenSel(imgUrl, title, descricao),
        itenSel(imgUrl, title, descricao),
        itenSel(imgUrl, title, descricao),
        itenSel(imgUrl, title, descricao),
      ],
    ),
  );*/
}
