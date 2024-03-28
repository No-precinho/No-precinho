import 'package:flutter/material.dart';

Widget itenSel(String imgUrl, String title, String descricao) {
  return Padding(
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
  );
}