import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


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
        title: Text('Leitor de Código de Barras'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Resultado:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              _barcodeResult,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanBarcode,
        tooltip: 'Escanear',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
