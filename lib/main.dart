import './StepForm.dart';
import 'package:flutter/material.dart';

void main() { // https://www.youtube.com/watch?v=lxSaD7jbsxM
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No precinho',
      home: StepForm(),
    );
  }
}
