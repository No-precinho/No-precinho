import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyInputField extends StatefulWidget {
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
    numberController.selection = TextSelection.collapsed(offset: numberController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
