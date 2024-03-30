import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './mercados.dart';

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
      appBar: AppBar(
          title: const Text(
            'No precinho',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFC70C65)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Container(
                          padding: const EdgeInsets.only(left: 50),
                          width: 200,
                          child: Text(
                            descricao,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Emporio Dom Olivio',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Text("Rua Furtado de Mendonça"),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            const Mercado(
                nome: "ABC",
                endereco: "Rua São Paulo da Cruz",
                preco: "R\$7,80"),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            const Mercado(
                nome: "Carrefour",
                endereco: "Rua João Soares de Senna",
                preco: "R\$8,40"),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            const Mercado(
                nome: "Dia%", endereco: "Rua Joatuba", preco: "R\$8,65"),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            const Mercado(
                nome: "Carrefour", endereco: "Rua Glocínia", preco: "R\$8,89"),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            const Mercado(
                nome: "Supernosso", endereco: "Rua Glocínia", preco: "R\$8,99"),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            const Mercado(
                nome: "Supernosso",
                endereco: "Rua Dois Mil Duzentos e Vinte",
                preco: "R\$8,99"),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
