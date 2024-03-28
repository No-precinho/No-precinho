import 'package:flutter/material.dart';
import '../StepForm.dart';

class login extends StatefulWidget {
  @override
  _login createState() => _login();
}

class _login extends State<login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
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
                  "Login",
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
      ),
    );
  }
}
