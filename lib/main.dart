/// @luix-F - Luiz Fernando Antunes da Silva Frassi
/// @RAFAEL2305003 - Rafael Rodrigues Oliveira
/// @yurideoliveira - Yuri de Oliveira Silva
/// @caioronan - Caio Ronan Horta
///
/// Projeto - @No-precinho
library;

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import './StepForm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Erro");
            } else {
              return StepForm();
            }
          })));
}
