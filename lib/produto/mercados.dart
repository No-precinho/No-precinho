import 'package:flutter/material.dart';

class Mercado extends StatelessWidget {
  final String nome;
  final String endereco;
  final String preco;

  const Mercado(
      {super.key,
      required this.nome,
      required this.endereco,
      required this.preco});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(

            children: [
              Text(
                nome,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(width: 10),
              Text(
                preco,
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                endereco,
                style: TextStyle(fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }
}
