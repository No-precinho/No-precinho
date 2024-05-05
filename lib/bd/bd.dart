import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Bd extends StatefulWidget {
  @override
  _BdState createState() => _BdState();
}

class _BdState extends State<Bd> {
  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco3.bd");
    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
      db.execute(sql);
    });
    return bd;
    //print("aberto: " + bd.isOpen.toString() );
  }

  createTable() async {
    final dbpath = await getDatabasesPath();
    final localdb = join(dbpath, "produtos.bd");

    var bd = await openDatabase(localdb, version: 1, onCreate: (db, dbvr) {
      String sql =
          "CREATE TABLE produtosMercados (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, preco REAL, idSupermercado INTEGER) ";
      db.execute(sql);
    });
    return bd;
  }

  _createTable2() async {
    final dbpath = await getDatabasesPath();
    final localdb = join(dbpath, "produtos.bd");

    var bd = await openDatabase(localdb, version: 1, onCreate: (db, dbvr) {
      String sql =
          "CREATE TABLE produtosT (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, preco REAL, idSupermercado VARCHAR, categoria VARCHAR, img VARCHAR) ";
      db.execute(sql);
    });
    return bd;
  }

  _insertProduto(/*String text, int parse*/) async {
    Database db = await _createTable2();
    Map<String, dynamic> dadosProdutos;
    dadosProdutos = {
      "nome": "Heineken_330ml",
      "preco": 7.39,
      "idSupermercado": 1,
      "categoria": "Adega e bebidas",
      "img":
          "https://cdn.awsli.com.br/2500x2500/2371/2371659/produto/169355378/304ad436dd.jpg"
    };
    int id = await db.insert("produtosT", dadosProdutos);
    print("Salvo: $id ");
    dadosProdutos = {
      "nome": "Vinho Tinto",
      "preco": 80.00,
      "idSupermercado": 1,
      "categoria": "Adega e bebidas",
      "img":
          "https://cdn.awsli.com.br/2500x2500/1377/1377751/produto/156502978/ad15e54743.jpg"
    };
    id = await db.insert("produtosT", dadosProdutos);
    print("Salvo: $id ");
    dadosProdutos = {
      "nome": "Gin Artesanal",
      "preco": 120.00,
      "idSupermercado": 1,
      "categoria": "Adega e bebidas",
      "img":
          "https://cdn.awsli.com.br/800x800/91/91186/produto/54300587/3df62b9a42.jpg"
    };
    id = await db.insert("produtosT", dadosProdutos);
    print("Salvo: $id ");
    dadosProdutos = {
      "nome": "Whisky Single",
      "preco": 150.00,
      "idSupermercado": 1,
      "categoria": "Adega e bebidas",
      "img": "https://cdn.iset.io/assets/50100/produtos/24/jack1.jpg"
    };
    id = await db.insert("produtosT", dadosProdutos);
    print("Salvo: $id ");
  }

  _listarProduto() async {
    Database bd = await _createTable2();
    String sql = "SELECT * FROM produtosT";
    //String sql = "SELECT * FROM usuarios WHERE idade=58";
    //String sql = "SELECT * FROM usuarios WHERE idade >=30 AND idade <=58";
    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 18 AND 58";
    //String sql = "SELECT * FROM usuarios WHERE nome='Maria Silva'";
    List produto =
        await bd.rawQuery(sql); //conseguimos escrever a query que quisermos
    for (var pro in produto) {
      print(" id: " +
          pro['id'].toString() +
          " nome: " +
          pro['nome'] +
          " preco: " +
          pro['preco'].toString() +
          " idSupermercado: " +
          pro['idSupermercado'].toString() +
          " categoria: " +
          pro['categoria'].toString());
      //" idade: "+usu['idade'].toString());
    }
  }

  _listarUmProduto(String nome, int idSupermercado) async {
    Database bd = await _createTable2();
    List produto = await bd.query("produtosT",
        columns: ["id", "nome", "preco", "idSupermercado", "categoria"],
        where: "nome = ?, idSupermercado = ?",
        whereArgs: [nome, idSupermercado]);
    for (var pro in produto) {
      print(" id: " +
          pro['id'].toString() +
          " nome: " +
          pro['nome'] +
          " preco: " +
          pro['preco'].toString() +
          " idSupermercado: " +
          pro['idSupermercado'].toString() +
          " categoria: " +
          pro['categoria'].toString());
    }
  }

  /*_excluirUsuario(int id) async{
    Database bd = await _recuperarBancoDados();
    int retorno = await bd.delete(
        "usuarios",
        where: "id = ?",  //caracter curinga
        whereArgs: [id]
    );
    print("Itens excluidos: "+retorno.toString());
  }*/

  _excluirUsuario() async {
    Database bd = await _recuperarBancoDados();
    int retorno = await bd.delete("usuarios",
        where: "nome = ? AND idade = ?", //caracter curinga
        whereArgs: ["Raquel Ribeiro", 26]);
    print("Itens excluidos: " + retorno.toString());
  }

  _atualizarProduto(String nome, Float preco, int idSupermercado) async {
    Database bd = await _createTable2();
    Map<String, dynamic> dadosProduto = {
      //"nome": "Heineken_330ml",
      "preco": preco,
      //"idSupermercado": 1,
      //"categoria": "Adega e bebidas",
      //"img": "https://cdn.awsli.com.br/2500x2500/2371/2371659/produto/169355378/304ad436dd.jpg"
    };
    int retorno = await bd.update("produtosT", dadosProduto,
        where: "nome = ? AND idSupermercado = ?", //caracter curinga
        whereArgs: [nome, idSupermercado]);
    print("Itens atualizados: " + retorno.toString());
    print("\n\n");
    _listarUmProduto(nome, idSupermercado);
  }

  // Area de acesso externo --------
  void listarProduto() {
    _listarProduto();
  }

  void atualizarProduto(String nome, String preco, String idSupermercado) {
    //print('F $preco I $idSupermercado');
    double? d = double.tryParse(preco.replaceAll(RegExp(r'[^0-9.]'), ''));
    int? ids = int.tryParse(idSupermercado.replaceAll(RegExp(r'[^0-9.]'), ''));

    print('1F $d I $ids');

    //print('2F $d I ');
    //_atualizarProduto(nome, preco as Float, idSupermercado as int);
  }
  // Area de acesso externo --------

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllernome = TextEditingController();
    TextEditingController _controlleridade = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Banco de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Digite o nome: ",
              ),
              controller: _controllernome,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Digite a idade: ",
              ),
              controller: _controlleridade,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    child: Text("Add "),
                    onPressed: () {
                      _insertProduto(
                          /*_controllernome.text, int.parse(_controlleridade.text)*/);
                    }),
                ElevatedButton(
                    child: Text("Listar todos "),
                    onPressed: () {
                      _listarProduto();
                    }),
                ElevatedButton(
                    child: Text("Listar um N"),
                    onPressed: () {
                      //_listarUmUsuario(2);
                    }),
                ElevatedButton(
                    child: Text("Atualizar um N"),
                    onPressed: () {
                      //_atualizarUsuario("2");
                    }),
                ElevatedButton(
                    child: Text("Excluir N"),
                    onPressed: () {
                      _excluirUsuario();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
