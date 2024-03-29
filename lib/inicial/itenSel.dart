import 'package:flutter/material.dart';
import '../produto/prodPrinc.dart';

Widget ForProd(
    String imgUrl, String title, String descricao, BuildContext context) {
  return GestureDetector(
    onTap: () {
      VoidCallbackAction();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => prodClass(imgUrl, title, descricao),
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
              imgUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            descricao,
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
