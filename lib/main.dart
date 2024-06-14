/// @luix-F - Luiz Fernando Antunes da Silva Frassi
/// @RAFAEL2305003 - Rafael Rodrigues Oliveira
/// @yurideoliveira - Yuri de Oliveira Silva
/// @caioronan - Caio Ronan Horta
///
/// Projeto - @No-precinho
library;

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './StepForm.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StepForm(),
  ));
}
