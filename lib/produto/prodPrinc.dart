import 'package:flutter/material.dart';
import './mercados.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../inicial/ProdInterface.dart';

class prodClass extends StatefulWidget {
  itenc it;
  prodClass(this.it);

  @override
  _prodClass createState() => _prodClass(it);
}

class _prodClass extends State<prodClass> {
  itenc it;
  _prodClass(this.it);

  _createTable() async {
    final dbpath = await getDatabasesPath();
    final localdb = join(dbpath, "produtos.bd");

    var bd = await openDatabase(localdb, version: 1, onCreate: (db, dbvr) {
      String sql =
          "CREATE TABLE produtosMercados (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, preco REAL, idSupermercado INTEGER) ";
      db.execute(sql);
    });
    return bd;
  }

  _insertProduto() async {
    Database db = await _createTable();
    Map<String, dynamic> dadosProdutos;
    dadosProdutos = {
      "nome": "Heineken_330ml",
      "preco": 7.39,
      "idSupermercado": 1
    };
    int id = await db.insert("produtosMercados", dadosProdutos);
    print("Salvo: $id ");
    dadosProdutos = {
      "nome": "Vinho Tinto",
      "preco": 80.00,
      "idSupermercado": 1
    };
    id = await db.insert("produtos", dadosProdutos);
    print("Salvo: $id ");
    dadosProdutos = {
      "nome": "Gin Artesanal",
      "preco": 120.00,
      "idSupermercado": 1
    };
    id = await db.insert("produtos", dadosProdutos);
    print("Salvo: $id ");
    dadosProdutos = {
      "nome": "Whisky Single",
      "preco": 150.00,
      "idSupermercado": 1
    };
    id = await db.insert("produtos", dadosProdutos);
    print("Salvo: $id ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
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
                            it.imgUr,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 50),
                          width: 200,
                          child: Text(
                            ('${it.preco}  ${it.nomecomplet}'),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 18,
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
            Mercado(
                nome: "ABC",
                endereco: "Rua São Paulo da Cruz",
                preco: (double.parse((it.precoR * 1.05).toStringAsFixed(2)))),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            Mercado(
                nome: "Carrefour",
                endereco: "Rua João Soares de Senna",
                preco: (double.parse((it.precoR * 1.1).toStringAsFixed(2)))),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            Mercado(
                nome: "Dia%",
                endereco: "Rua Joatuba",
                preco: (double.parse((it.precoR * 1.12).toStringAsFixed(2)))),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            Mercado(
                nome: "Carrefour",
                endereco: "Rua Glocínia",
                preco: (double.parse((it.precoR * 1.15).toStringAsFixed(2)))),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            Mercado(
                nome: "Supernosso",
                endereco: "Rua Glocínia",
                preco: (double.parse((it.precoR * 1.2).toStringAsFixed(2)))),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 2,
            ),
            Mercado(
                nome: "Supernosso",
                endereco: "Rua Dois Mil Duzentos e Vinte",
                preco: (double.parse((it.precoR * 1.2).toStringAsFixed(2)))),
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
