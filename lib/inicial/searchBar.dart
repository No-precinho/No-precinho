import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sprint2/produto/CategoryProductsScreen.dart';
import 'package:sprint2/inicial/ProdInterface.dart';
import 'package:sprint2/produto/prodPrinc.dart';
import 'package:sprint2/modelos/category.dart';

class Inc extends StatefulWidget {
  @override
  _Inc createState() => _Inc();
}

class _Inc extends State<Inc> {
  Future<List<Category>> getAllCategories() async {
    List<Category> categories = [];
    CollectionReference categoriesRef =
        FirebaseFirestore.instance.collection('categories');
    QuerySnapshot categorySnapshot = await categoriesRef.get();
    for (var doc in categorySnapshot.docs) {
      QuerySnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where("idCategory", isEqualTo: doc.id)
          .limit(1)
          .get();
      if (productSnapshot.docs.isNotEmpty) {
        categories.add(Category.fromFirestore(doc));
      }
    }
    return categories;
  }

  Future<String> getMinimumPrice(String productId) async {
    var marketProductsRef =
        FirebaseFirestore.instance.collection('marketProducts');
    var querySnapshot = await marketProductsRef
        .where("idProduct", isEqualTo: productId)
        .orderBy("preco", descending: false)
        .limit(1)
        .get();
    return querySnapshot.docs.isNotEmpty
        ? "R\$ ${querySnapshot.docs.first.get("preco")}"
        : "Preço não disponível";
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(useMaterial3: true);
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
                  return Center(
                      child: Text(
                          "Erro ao carregar categorias: ${categorySnapshot.error}"));
                } else if (categorySnapshot.hasData &&
                    categorySnapshot.data!.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      children: categorySnapshot.data!
                          .map((category) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryProductsScreen(
                                                  categoryId: category.id,
                                                  categoryName: category.name),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(category.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 180,
                                    child: FutureBuilder<QuerySnapshot>(
                                      future: FirebaseFirestore.instance
                                          .collection('products')
                                          .where("idCategory",
                                              isEqualTo: category.id)
                                          .get(),
                                      builder: (context, productSnapshot) {
                                        if (productSnapshot.connectionState ==
                                            ConnectionState.done) {
                                          if (productSnapshot.hasError) {
                                            return SizedBox.shrink();
                                          } else if (productSnapshot.hasData &&
                                              productSnapshot
                                                  .data!.docs.isNotEmpty) {
                                            return ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: productSnapshot
                                                  .data!.docs.length,
                                              itemBuilder: (context, index) {
                                                var productDoc = productSnapshot
                                                    .data!.docs[index];
                                                return FutureBuilder<String>(
                                                  future: getMinimumPrice(
                                                      productDoc.id),
                                                  builder:
                                                      (context, priceSnapshot) {
                                                    if (priceSnapshot
                                                            .connectionState ==
                                                        ConnectionState.done) {
                                                      itenc item = itenc();
                                                      item = transferencia(
                                                        productDoc.id,
                                                        priceSnapshot.data ??
                                                            "Preço não disponível",
                                                        productDoc.get("name"),
                                                        productDoc.get("image"),
                                                        item,
                                                      );
                                                      return GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      prodClass(
                                                                          item),
                                                            ),
                                                          );
                                                        },
                                                        child: Card(
                                                          elevation: 0,
                                                          color: Colors.white10,
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            16),
                                                                child: Image.network(
                                                                    productDoc.get(
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
                                                                      productDoc.get("name").length >
                                                                              20
                                                                          ? '${productDoc.get("name").substring(0, 15)}...'
                                                                          : productDoc
                                                                              .get("name"),
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    Text(
                                                                      '${priceSnapshot.data ?? "Preço não disponível"}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              11,
                                                                          color:
                                                                              Colors.green),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  },
                                                );
                                              },
                                            );
                                          } else {
                                            return Center(
                                                child: Text(
                                                    'Nenhum produto encontrado nesta categoria.'));
                                          }
                                        } else {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ))
                          .toList(),
                    ),
                  );
                } else {
                  return Center(
                      child:
                          Text('Nenhuma categoria com produtos encontrada.'));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
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
    it.precoR = d ?? 0.0;
    return it;
  }
}
