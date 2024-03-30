import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './itenSel.dart';
import './ProdInterface.dart';

Widget linhas(itensRowc itR, /*int i,*/ BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      //padding: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // iten 1
          ForProd(itR.it1, /*i, 1,*/ context),
          // iten 2
          ForProd(itR.it2, /*i, 2,*/ context),
          // iten 3
          ForProd(itR.it3, /*i, 3,*/ context),
          // iten 4
          ForProd(itR.it4, /*i, 4,*/ context),
          // iten 5
          ForProd(itR.it5, /*i, 5,*/ context),
        ],
      ),
    ),
  );
}
