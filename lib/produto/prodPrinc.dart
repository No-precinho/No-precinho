import 'package:flutter/material.dart';
import './mercados.dart';
import '../inicial/ProdInterface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class prodClass extends StatefulWidget {
  itenc it;
  prodClass(this.it);

  @override
  _prodClass createState() => _prodClass(it);
}

class _prodClass extends State<prodClass> {
  itenc it;
  _prodClass(this.it);

  List<String> markets = [];

  @override
  void initState() {
    super.initState();
    loadMarkets();
  }

  void loadMarkets() async {
    var marketList = await getMarkets(it.id);
    setState(() {
      markets = marketList;
    });
  }

  Future<List<String>> getMarkets(String idProduct) async {
    List<String> markets = [];
    CollectionReference productsRef =
        FirebaseFirestore.instance.collection('marketProducts');
    CollectionReference marketRef =
        FirebaseFirestore.instance.collection('supermarkets');

    QuerySnapshot querySnapshot = await productsRef
        .where("idProduct", isEqualTo: idProduct)
        .orderBy("preco")
        .get();

    for (var doc in querySnapshot.docs) {
      DocumentSnapshot documentSnapshot =
          await marketRef.doc(doc.get("idSupermarket")).get();
      String aux =
          "${documentSnapshot.get("name")}_${documentSnapshot.get("address")}_${doc.get("preco")}";
      markets.add(aux);
    }

    return markets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(it.imgUr,
                              width: 80, height: 80, fit: BoxFit.cover),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('R\$ ${it.preco}  ${it.nomecomplet}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            markets.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: markets.length,
                    itemBuilder: (context, index) {
                      var marketDetails = markets[index].split('_');
                      return ListTile(
                        title: Text(marketDetails[0]),
                        subtitle: Text(marketDetails[1]),
                        trailing: Text('R\$ ${marketDetails[2]}'),
                      );
                    },
                  )
                : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
