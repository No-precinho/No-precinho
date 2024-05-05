import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../StepForm.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  @override
  _login createState() => _login();
}

class _login extends State<login> {
  Future<bool> verifyEmailAndPassword(String email, String password) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .where('senha', isEqualTo: password)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<bool> login(String email, String password) async {
    bool isAuthenticated = await verifyEmailAndPassword(email, password);

    if (isAuthenticated) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      prefs.setString('password', password);
    }

    return isAuthenticated;
  }

  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllersenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          backgroundColor: const Color(0xFFC70C65)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Login",
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
              padding: const EdgeInsets.all(32),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF6D0CB9)),
                  fixedSize: MaterialStateProperty.all(const Size(130, 50)),
                ),
                onPressed: () {
                  var bytes = utf8.encode(_controllersenha.text);
                  var senhaComMd5 = md5.convert(bytes);
                  login(_controlleremail.text, senhaComMd5.toString());
                  verifyEmailAndPassword(
                      _controlleremail.text, senhaComMd5.toString());
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => StepForm()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  'Login',
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
