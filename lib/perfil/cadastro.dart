import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
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
    final localdb = join(dbpath, "clientes.bd");

    var bd = await openDatabase(localdb, version: 1, onCreate: (db, dbvr) {
      String sql =
          "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, email VARCHAR, senha VARCHAR) ";
      db.execute(sql);
    });
    return bd;
  }

  _insertUser(String nome, String email, String senha) async {
    Database db = await _createTable();
    Map<String, dynamic> dadosUsuario = {
      "nome": nome,
      "email": email,
      "senha": senha
    };
    int id = await db.insert("usuarios", dadosUsuario);
    //print("Salvo: $id ");
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
                  if (_controllersenha.text == _controllerconfirmarsenha.text)
                    _insertUser(_controllernome.text, _controlleremail.text,
                        _controllersenha.text);
                  else {
                    print('As senhas não são iguais!');
                    const Text(
                      'As senhas não são iguais!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 224, 12, 12),
                      ),
                    );
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
