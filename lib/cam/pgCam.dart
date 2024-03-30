import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import './preco.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
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
                    (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 32.0)),
                    hintText: 'Pesquisar supermercados',
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                  );
                }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
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
                  CurrencyInputField(),
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
                  // Adicione o código para o que deve acontecer quando o botão é pressionado
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
}
