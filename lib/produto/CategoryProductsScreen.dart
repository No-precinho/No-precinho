import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sprint2/inicial/ProdInterface.dart';
import 'package:sprint2/produto/prodPrinc.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  const CategoryProductsScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  Future<String?> getMinimumPrice(String productId) async {
    try {
      CollectionReference marketProductsRef =
          FirebaseFirestore.instance.collection('marketProducts');
      QuerySnapshot querySnapshot = await marketProductsRef
          .where("idProduct", isEqualTo: productId)
          .orderBy("preco")
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.get("preco").toString();
      }
    } catch (e) {
      print("Erro ao obter o menor preço: $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference productsRef =
        FirebaseFirestore.instance.collection('products');

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: productsRef.where("idCategory", isEqualTo: categoryId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                  child: Text("Erro ao buscar dados: ${snapshot.error}"));
            }

            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data!.docs[index];
                  return FutureBuilder<String?>(
                    future: getMinimumPrice(doc.id),
                    builder: (context, priceSnapshot) {
                      if (priceSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return ListTile(
                          title: Text(doc.get("name")),
                          subtitle: Text('R\$...'),
                        );
                      } else if (priceSnapshot.hasError) {
                        return ListTile(
                          title: Text(doc.get("name")),
                          subtitle: Text('Erro ao carregar preço.'),
                        );
                      } else if (priceSnapshot.hasData) {
                        return ListTile(
                          leading: Image.network(doc.get("image")),
                          title: Text(doc.get("name")),
                          subtitle: Text('R\$ ${priceSnapshot.data}'),
                          onTap: () {
                            itenc item = itenc();
                            item = transferencia(doc.id, priceSnapshot.data!,
                                doc.get("name"), doc.get("image"), item);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => prodClass(item),
                              ),
                            );
                          },
                        );
                      } else {
                        return ListTile(
                          title: Text(doc.get("name")),
                          subtitle: Text('Preço não disponível'),
                        );
                      }
                    },
                  );
                },
              );
            } else {
              return Center(
                  child: Text('Nenhum produto encontrado nesta categoria.'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  itenc transferencia(
      String id, String preco, String name, String img, itenc it) {
    it.id = id;
    it.nomecomplet = name;
    it.imgUr = img;
    it.preco = preco;
    double? d = double.tryParse(preco.replaceAll(RegExp(r'[^0-9.]'), '.'));
    it.precoR = d!;
    return it;
  }
}
