import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../produto/prodPrinc.dart';
import './itenSel.dart';

Widget linhas(
    String imgUrl, String title, String descricao, BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      //padding: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // iten 1
          ForProd(imgUrl, title, descricao, context),
          // iten 2
          ForProd(imgUrl, title, descricao, context),
          // iten 3
          ForProd(imgUrl, title, descricao, context),
          // iten 4
          ForProd(imgUrl, title, descricao, context),
          // iten 5
          ForProd(imgUrl, title, descricao, context),
        ],
      ),
    ),
  );
}
