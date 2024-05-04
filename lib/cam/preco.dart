import 'dart:async';
import '../bd/bd.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyInputField extends StatefulWidget {
  /*TextEditingController getControl() {
    _CurrencyInputFieldState getcur = _CurrencyInputFieldState();
    return getcur.getControl();
  }*/

  @override
  _CurrencyInputFieldState createState() => _CurrencyInputFieldState();
}

class _CurrencyInputFieldState extends State<CurrencyInputField> {
  TextEditingController numberController = TextEditingController(text: "0,00");

  @override
  void initState() {
    super.initState();
    numberController.addListener(_updateValue);
  }

  @override
  void dispose() {
    numberController.removeListener(_updateValue);
    numberController.dispose();
    super.dispose();
  }

  void _updateValue() {
    String text = numberController.text.replaceAll(",", "").padLeft(3, '0');
    if (text.length > 5) {
      text = text.substring(text.length - 5);
    }
    double value = int.parse(text) / 100;

    numberController.text = value.toStringAsFixed(2).replaceAll(".", ",");
    numberController.selection =
        TextSelection.collapsed(offset: numberController.text.length);
  }

  TextEditingController getControl() {
    //TextEditingController ctrl = numberController;
    return numberController;
  }

  @override
  Widget build(BuildContext context) {
    Bd acessbd = Bd();
    return Column(children: [
      TextFormField(
        controller: numberController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefixText: 'R\$ ',
          border: OutlineInputBorder(),
          labelText: 'Valor',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
      ElevatedButton(
          child: const Text("Precos "),
          onPressed: () {
            //acessbd.createState().listarProduto();
            print("\nP: " + numberController.text);
          }),
    ]);
  }
}
