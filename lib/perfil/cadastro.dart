import 'package:flutter/material.dart';
import '../StepForm.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
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
              const Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome completo: ',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail: ',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha: ',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(32),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha: ',
                  ),
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