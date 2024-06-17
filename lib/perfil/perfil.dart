import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sprint2/perfil/tela_perfil.dart';
import './cadastro.dart';
import './login.dart';
import './sobre.dart';

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Ocorreu um erro'));
        } else if (snapshot.hasData) {
          return ProfilePage();
        } else {
          return perButtons();
        }
      },
    );
  }
}

class perButtons extends StatefulWidget {
  @override
  _perButtonsState createState() => _perButtonsState();
}

class _perButtonsState extends State<perButtons> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(180, 50)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: const Text(
                    '   Login   ',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(11)),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(180, 50)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ),
                    );
                  },
                  child: const Text(
                    'Cadastro',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(80, 30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutScreen(),
                  ),
                );
              },
              child: const Text(
                'Sobre',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
