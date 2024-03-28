import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './cadastro.dart';
import './login.dart';

class perButtons extends StatefulWidget {
  @override
  _perButtons createState() => _perButtons();
}

class _perButtons extends State<perButtons> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Color(0xFF6D0CB9)),
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
                backgroundColor: const MaterialStatePropertyAll(Color(0xFF6D0CB9)),
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
      )
    );
  }
}


