import 'package:flutter/material.dart';
import '../produto/prodPrinc.dart';
import './ProdInterface.dart';

Widget ForProd(itenc it, /*int x, int y,*/ BuildContext context) {
  return GestureDetector(
    onTap: () {
      /*
      if (x == 1) {
        itR.gerador1();
      } else if (x == 2) {
        itR.gerador2();
      } else if (x == 3) {
        itR.gerador3();
      } else if (x == 4) {
        itR.gerador4();
      } else if (x == 5) {
        itR.gerador5();
      }*/
      VoidCallbackAction();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              prodClass(it),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 30,),),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              it.imgUr,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            '${it.preco}\n${it.title}',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ),
  );
}
