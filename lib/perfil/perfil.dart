import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './cadastro.dart';
import './login.dart';
import './sobre.dart';

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
                    backgroundColor: MaterialStateProperty.all(Color(0xFF6D0CB9)),
                    fixedSize: MaterialStateProperty.all(const Size(180, 50)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => login(),
                      ),
                    );
                  },
                  child: const Text(
                    '   Login   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(11)),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF6D0CB9)),
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
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,

            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF6D0CB9)),
                fixedSize: MaterialStateProperty.all(const Size(80, 30)),
              ),
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(), // Navegar para a tela "Sobre"
                    ),
                  );
                },
              child: const Text(
                'Sobre',
                style: TextStyle(
                  color: Colors.white,
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
