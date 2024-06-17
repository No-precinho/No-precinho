import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Auth_check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Ocorreu um erro'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return NotLoggedInPage();
        } else {
          return BarcodeScannerPage();
        }
      },
    );
  }
}

class NotLoggedInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Você não está logado. Por favor, faça login para acessar esta página.',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  TextEditingController _controllerPreco = TextEditingController();
  TextEditingController _controllerSupermercado = TextEditingController();
  String _barcodeResult = 'Aguardando leitura do código de barras...';
  String _selectedSupermarket = '';
  String _selectedSupermarketAddress = '';
  String _selectedSupermarketId = '';
  bool _isSearching = false;

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

  Future<List<Map<String, String>>> _fetchSupermarkets(String query) async {
    CollectionReference ref =
        FirebaseFirestore.instance.collection('supermarkets');
    QuerySnapshot querySnapshot = await ref.get();

    List<Map<String, String>> supermarkets = querySnapshot.docs.map((doc) {
      String id = doc.id;
      String name = doc['name'].toString();
      String address = doc['address'].toString();
      return {'id': id, 'name': name, 'address': address};
    }).toList();

    if (query.isNotEmpty) {
      supermarkets = supermarkets.where((supermarket) {
        return supermarket['name']!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            supermarket['address']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    return supermarkets;
  }

  bool get _isButtonEnabled =>
      _selectedSupermarketId.isNotEmpty &&
      _barcodeResult != 'Aguardando leitura do código de barras...';

  void _showProductNotFoundAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Produto não encontrado!'),
          content: Text(
              'O produto com o código de barras fornecido não foi encontrado.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                child: TextField(
                  controller: _controllerSupermercado,
                  decoration: InputDecoration(
                    hintText: 'Pesquisar supermercados',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (query) {
                    setState(() {
                      _isSearching = query.isNotEmpty;
                      _selectedSupermarket = '';
                      _selectedSupermarketAddress = '';
                      _selectedSupermarketId = '';
                    });
                  },
                ),
              ),
              if (_isSearching)
                FutureBuilder<List<Map<String, String>>>(
                  future: _fetchSupermarkets(_controllerSupermercado.text),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    var suggestions = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: suggestions.length,
                      itemBuilder: (context, index) {
                        var item = suggestions[index];
                        return ListTile(
                          title: Text(item['name']!),
                          subtitle: Text(item['address']!),
                          onTap: () {
                            setState(() {
                              _controllerSupermercado.text = item['name']!;
                              _selectedSupermarket = item['name']!;
                              _selectedSupermarketAddress = item['address']!;
                              _selectedSupermarketId = item['id']!;
                              _isSearching = false;
                            });
                          },
                        );
                      },
                    );
                  },
                ),
              if (!_isSearching)
                Column(
                  children: [
                    if (_selectedSupermarket.isNotEmpty)
                      ListTile(
                        title: Text(_selectedSupermarket),
                        subtitle: Text(_selectedSupermarketAddress),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: 'R\$ ',
                          border: OutlineInputBorder(),
                          labelText: 'Valor',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(130, 50)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey
                                  .shade400; // Cor quando o botão está desabilitado
                            }
                            return Colors
                                .white; // Cor quando o botão está habilitado
                          },
                        ),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey
                                  .shade700; // Texto quando o botão está desabilitado
                            }
                            return Colors
                                .purple; // Texto quando o botão está habilitado
                          },
                        ),
                      ),
                      onPressed: _isButtonEnabled
                          ? () {
                              print(":::::: $_barcodeResult");
                              atualizarProduto(
                                  _barcodeResult,
                                  _selectedSupermarketId,
                                  numberController.text);
                            }
                          : null,
                      child: const Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
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

  void atualizarProduto(String cod, String supermarketId, String preco) {
    double? d = double.tryParse(preco.replaceAll(RegExp(r'[^0-9.]'), '.'));
    if (d != null) {
      _atzValor(cod, supermarketId, d);
    }
  }

  void _atzValor(String cod, String supermarketId, double prec) async {
    CollectionReference marketProductsRef =
        FirebaseFirestore.instance.collection('marketProducts');
    QuerySnapshot qs = await marketProductsRef
        .where("EAN", isEqualTo: cod)
        .where("idSupermarket", isEqualTo: supermarketId)
        .get();

    if (qs.docs.isNotEmpty) {
      DocumentSnapshot ds = qs.docs.first;
      ds.reference.update({'preco': prec}).then((value) {
        print("Document Updated");
        _showSnackbar("Preço atualizado com sucesso!");
      }).catchError((error) {
        print("Failed to update document: $error");
        _showSnackbar("Erro ao atualizar o preço!");
      });
    } else {
      CollectionReference productsRef =
          FirebaseFirestore.instance.collection('products');
      QuerySnapshot productQuery =
          await productsRef.where("EAN", isEqualTo: cod).get();

      if (productQuery.docs.isNotEmpty) {
        String productId = productQuery.docs.first.id;
        marketProductsRef.add({
          "EAN": cod,
          "idSupermarket": supermarketId,
          "preco": prec,
          "idProduct": productId,
        }).then((value) {
          print("Document Added");
          _showSnackbar("Produto adicionado com sucesso!");
        }).catchError((error) {
          print("Failed to add document: $error");
          _showSnackbar("Erro ao adicionar o produto!");
        });
      } else {
        _showProductNotFoundAlert();
      }
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

TextEditingController numberController = TextEditingController(text: "0,00");

Future<void> _refreshPage() async {
  await Future.delayed(Duration(seconds: 1));
  print('Página recarregada');
}
