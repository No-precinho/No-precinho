import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../StepForm.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  _createTable() async {
    final dbpath = await getDatabasesPath();
    final localdb = join(dbpath, "clientes_local.bd");

    var bd = await openDatabase(localdb, version: 1, onCreate: (db, dbvr) {
      String sql =
          "CREATE TABLE usuarios_local (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR) ";
      db.execute(sql);
    });
    return bd;
  }

  _insertUserLocal(String nome) async {
    Database db = await _createTable();
    Map<String, dynamic> dadosUsuario = {"nome": nome};
    int id = await db.insert("usuarios_local", dadosUsuario);
    print("Salvo: $id ");
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllernome = TextEditingController();
    TextEditingController _controlleremail = TextEditingController();
    TextEditingController _controllersenha = TextEditingController();
    TextEditingController _controllerconfirmarsenha = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'No precinho',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFC70C65),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Cadastro",
                style: TextStyle(
                  color: Color(0xFFC70C65),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nome completo: ',
                ),
                controller: _controllernome,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail: ',
                ),
                controller: _controlleremail,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha: ',
                ),
                controller: _controllersenha,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmar senha: ',
                ),
                controller: _controllerconfirmarsenha,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF6D0CB9)),
                  fixedSize: MaterialStateProperty.all(const Size(130, 50)),
                ),
                onPressed: () {
                  if (_controllernome.text != "" &&
                      _controlleremail.text.contains("@") &&
                      _controlleremail.text.contains(".com") &&
                      _controllersenha.text == _controllerconfirmarsenha.text &&
                      _controllersenha.text.length <= 3)
                    _insertUserLocal(_controllernome.text);
                  else {
                    print('O nome/email/senha nao sao validos!');
                  }
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => StepForm()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
