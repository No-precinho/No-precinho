import 'package:cloud_firestore/cloud_firestore.dart';
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
                    TextField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: 'R\$ ',
                        border: OutlineInputBorder(),
                        labelText: 'Valor',
                      ),
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
                  print(":::::: $_barcodeResult");
                  //acessbd.createState().atualizarProduto("Heineken_330ml", numberController.text, _controllersupermercado.text);
                  atualizarProduto(_barcodeResult, _controllersupermercado.text,
                      numberController.text);
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
    CollectionReference ref =
        FirebaseFirestore.instance.collection('supermarkets');

    QuerySnapshot querySnapshot =
        await ref.where("name", isEqualTo: supermark).get();

    if (querySnapshot.size > 0) {
      String idSupermarket = querySnapshot.docs.first.id;
      CollectionReference productsRef =
          FirebaseFirestore.instance.collection('marketProducts');
      QuerySnapshot qs = await productsRef
          .where("EAN", isEqualTo: cod)
          .where("idSupermarket", isEqualTo: idSupermarket)
          .get();

      DocumentSnapshot ds = qs.docs.first;
      ds.reference
          .update({'preco': prec})
          .then((value) => print("Document Updated"))
          .catchError((error) => print("Failed to update document: $error"));
    } else {
      print("No documents found");
    }
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
