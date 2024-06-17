import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final localdb = join(dbpath, "clientesLocal.bd");

    var bd = await openDatabase(localdb, version: 1, onCreate: (db, dbvr) {
      String sql =
          "CREATE TABLE usuarios_local (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR) ";
      db.execute(sql);
    });
    return bd;
  }

  Future<void> _insertUserLocal(String nome, String email, String senha) async {
    Database db = await _createTable();
    var bytes = utf8.encode(senha);
    var senhaComMd5 = md5.convert(bytes).toString();

    Map<String, dynamic> dadosUsuario = {"nome": nome};
    int id = await db.insert("usuarios_local", dadosUsuario);

    await _registerUser(nome, email, senhaComMd5);
  }

  Future<void> _registerUser(String nome, String email, String senha) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      // Obter usuário atual
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateDisplayName(nome);
      }

      CollectionReference usuarios =
          FirebaseFirestore.instance.collection('users');
      await usuarios
          .doc(userCredential.user?.uid)
          .set({'nome': nome, 'email': email});
      print(
          "Usuário adicionado ao Firestore com sucesso: ${userCredential.user?.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('A senha fornecida é muito fraca.');
      } else if (e.code == 'email-already-in-use') {
        print('A conta já existe para esse email.');
      }
    } catch (e) {
      print("Erro ao registrar usuário: $e");
    }
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
                  fixedSize: MaterialStateProperty.all(const Size(130, 50)),
                ),
                onPressed: () {
                  _insertUserLocal(_controllernome.text, _controlleremail.text,
                      _controllersenha.text);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => StepForm()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  'Salvar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
