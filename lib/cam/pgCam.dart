import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import './preco.dart';
import '../bd/bd.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  TextEditingController _controllerpreco = TextEditingController();
  TextEditingController _controllersupermercado = TextEditingController();
  String mercadinho2 = "";
  String alert = "";
  String _barcodeResult = 'Aguardando leitura do código de barras...';

  Future<void> _scanBarcode() async {
    String barcodeResult;
    try {
      barcodeResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.DEFAULT);
    } catch (e) {
      barcodeResult = 'Erro ao escanear: $e';
    }

    if (!mounted) return;

    setState(() {
      _barcodeResult = barcodeResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    Bd acessbd = Bd();
    //CurrencyInputField preco = CurrencyInputField();
    //CurrencyInputFieldState prec2 = preco.createState();
    //

    //String mercadinho = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Atualizar produtos',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Código de barras lido:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                _barcodeResult,
                style: const TextStyle(fontSize: 14),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SearchAnchor(builder:
                    (BuildContext context, TextEditingController controllerM) {
                  return SearchBar(
                    controller: controllerM,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 32.0)),
                    hintText: 'Pesquisar supermercados',
                    onTap: () {
                      //controllerM.openView();
                    },
                    onChanged: (_) {
                      mercadinho2 = controllerM.text;
                      _controllersupermercado = controllerM;
                      //mercadinho3 = _;
                      //controllerM.openView();
                    },
                    leading: const Icon(Icons.search),
                  );
                }, suggestionsBuilder:
                    (BuildContext context, SearchController controllerM2) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controllerM2.closeView(item);
                        });
                      },
                    );
                  });
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
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
                    ), /*
                    ElevatedButton(
                        child: const Text("Precos "),
                        onPressed: () {
                          print("\nP: " + numberController.text);
                        }),*/
                    //CurrencyInputField(),
                    // Outros widgets podem ser adicionados aqui
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF6D0CB9)),
                  fixedSize: MaterialStateProperty.all(const Size(180, 50)),
                ),
                onPressed: () {
                  //acessbd.createState().atualizarProduto("Heineken_330ml", numberController.text, _controllersupermercado.text);
                  atualizarProduto(
                      '0', _controllersupermercado.text, numberController.text);
                },
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanBarcode,
        tooltip: 'Escanear',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  //Banc

  void atualizarProduto(String nome, String idSupermercado, String preco) {
    double? d = double.tryParse(preco.replaceAll(RegExp(r'[^0-9.]'), '.'));
    _atzValor(nome, idSupermercado, d!);
  }

  void _atzValor(String cod, String supermark, double prec) async {
    // Verific
    final quer = FirebaseDatabase.instance.ref();
    final snapshot = await quer.child('productmercado/$supermark-$cod').get();
    print('$supermark-$cod');
    if (snapshot.exists) {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("productmercado/$supermark-$cod");
      // Only update the name, leave the age and address!
      await ref.update({
        "preco": prec,
      });
      print("Foi3");
      alertaset(1);
    } else {
      alertaset(0);
      print('No data available.');
    }
    //Atz
  }

  void alertaset(int i) {
    if (i == 1) {
      setState(() {
        _barcodeResult = "Iten atualizado";
      });
      _refreshPage();
    } else {
      setState(() {
        _barcodeResult = "Não foi possivel atualizar iten";
      });
    }
  }

  Future<void> _refreshPage() async {
    // Lógica para recarregar a página
    await Future.delayed(
        Duration(seconds: 1)); // Simulando um processo assíncrono
    print('Página recarregada');
  }

  //floatis

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
}
