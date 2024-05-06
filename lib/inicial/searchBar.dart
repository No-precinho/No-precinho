import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sprint2/inicial/ProdInterface.dart';
import 'package:sprint2/produto/prodPrinc.dart';

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});
}

class Inc extends StatefulWidget {
  @override
  _Inc createState() => _Inc();
}

class _Inc extends State<Inc> {
  Future<List<Category>> getAllCategories() async {
    List<Category> categories = [];
    CollectionReference categoriesRef =
        FirebaseFirestore.instance.collection('categories');
    QuerySnapshot querySnapshot = await categoriesRef.get();
    for (var doc in querySnapshot.docs) {
      categories.add(Category(id: doc.id, name: doc.get("name")));
    }
    return categories;
  }

  Future<QuerySnapshot> getProducts(String idCategory) async {
    CollectionReference productsRef =
        FirebaseFirestore.instance.collection('products');
    return await productsRef.where("idCategory", isEqualTo: idCategory).get();
  }

  Future<String?> getPrice(String idProduct) async {
    CollectionReference productsRef =
        FirebaseFirestore.instance.collection('marketProducts');

    QuerySnapshot querySnapshot = await productsRef
        .where("idProduct", isEqualTo: idProduct)
        .orderBy("preco")
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.get("preco").toString();
    } else {
      return null;
    }
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

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(useMaterial3: true);
    itenc it = new itenc();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        body: NestedScrollView(
          scrollDirection: Axis.vertical,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              toolbarHeight: 80,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Busque o que deseja',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ],
          body: FutureBuilder<List<Category>>(
            future: getAllCategories(),
            builder: (context, categorySnapshot) {
              if (categorySnapshot.connectionState == ConnectionState.done) {
                if (categorySnapshot.hasError) {
                  return Text(
                      "Erro ao carregar categorias: ${categorySnapshot.error}");
                } else if (categorySnapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: categorySnapshot.data!
                          .map((category) => FutureBuilder<QuerySnapshot>(
                                future: getProducts(category.id),
                                builder: (context, productSnapshot) {
                                  if (productSnapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (productSnapshot.hasError) {
                                      return SizedBox.shrink();
                                    } else if (productSnapshot.hasData &&
                                        productSnapshot.data!.docs.isNotEmpty) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              category.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 180,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: productSnapshot
                                                    .data!.docs.length,
                                                itemBuilder: (context, index) {
                                                  var doc = productSnapshot
                                                      .data!.docs[index];
                                                  return GestureDetector(
                                                      onTap: () async {
                                                        try {
                                                          String? preco =
                                                              await getPrice(
                                                                  doc.id);
                                                          if (preco != null) {
                                                            it = transferencia(
                                                                doc.id,
                                                                preco,
                                                                doc.get("name"),
                                                                doc.get(
                                                                    "image"),
                                                                it);
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        prodClass(
                                                                            it),
                                                              ),
                                                            );
                                                          } else {
                                                            // Trate o caso de preco ser null, se necessário
                                                          }
                                                        } catch (e) {
                                                          // Trate o caso de erro aqui
                                                          print(
                                                              "Erro ao obter o preço: $e");
                                                        }
                                                      },
                                                      child: Card(
                                                        elevation: 0,
                                                        color: Colors.white10,
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 16),
                                                              child: Image.network(
                                                                  doc.get(
                                                                      "image"),
                                                                  width: 100,
                                                                  height: 100,
                                                                  fit: BoxFit
                                                                      .cover),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    doc.get("name").length >
                                                                            20
                                                                        ? '${doc.get("name").substring(0, 15)}...'
                                                                        : doc.get(
                                                                            "name"),
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                  FutureBuilder<
                                                                      String?>(
                                                                    future: getPrice(
                                                                        doc.id),
                                                                    builder: (BuildContext
                                                                            context,
                                                                        AsyncSnapshot<String?>
                                                                            snapshot) {
                                                                      if (snapshot
                                                                              .connectionState ==
                                                                          ConnectionState
                                                                              .waiting) {
                                                                        return CircularProgressIndicator();
                                                                      } else if (snapshot
                                                                          .hasError) {
                                                                        return Text(
                                                                            'Erro: ${snapshot.error}');
                                                                      } else if (snapshot
                                                                          .hasData) {
                                                                        return Text(
                                                                          ' R\$ ${snapshot.data}',
                                                                          style: TextStyle(
                                                                              fontSize: 11,
                                                                              color: Colors.green),
                                                                        );
                                                                      } else {
                                                                        return Text(
                                                                            'Preço não disponível');
                                                                      }
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ));
                                                }),
                                          )
                                        ],
                                      );
                                    }
                                  }
                                  return SizedBox.shrink();
                                },
                              ))
                          .toList(),
                    ),
                  );
                }
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
