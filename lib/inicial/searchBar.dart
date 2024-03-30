import 'package:flutter/material.dart';
import './rowsInten.dart';
import './ProdInterface.dart';

class Inc extends StatefulWidget {
  @override
  _Inc createState() => _Inc();
}

const String imgUrl =
    'https://image.cdn2.seaart.ai/2024-03-01/cnh3ec5e878c738rbgf0/ba8d5cc37c75f4d301038456f9fe21a4468e7662_high.webp';
String title = 'Bebidas';
String descricao = '7,39 R\$ \nHeineken_330ml';

class _Inc extends State<Inc> {
  itensRowc itR1 = new itensRowc();
  itensRowc itR2 = new itensRowc();
  itensRowc itR3 = new itensRowc();
  itensRowc itR4 = new itensRowc();
  itensRowc itR5 = new itensRowc();
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(useMaterial3: true);
    itR1.gerador1();
    itR2.gerador2();
    itR3.gerador3();
    itR4.gerador4();
    itR5.gerador5();

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
                        child: SearchAnchor(builder: (BuildContext context,
                            SearchController controller) {
                          return SearchBar(
                            controller: controller,
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 16.0)),
                            hintText: 'Busque o que deseja',
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            leading: const Icon(Icons.search),
                          );
                        }, suggestionsBuilder: (BuildContext context,
                            SearchController controller) {
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
                    ),
                  ],
              body: SingleChildScrollView(
                // https://listenx.com.br/blog/setores-de-um-supermercado/
                child: Column(
                  children: [
                    const Align(
                      //Linha: 1 --------------------------------------------------------------------------------
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        // vinhos, cervejas, whisky, sucos, refrigerantes, água;
                        "Adega e bebidas",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linhas(itR1, context),
                    const Align(
                      //Linha: 2 --------------------------------------------------------------------------------
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        // presuntos, salames, diferentes tipos de queijos, iogurtes, leites (em alguns supermercados eles podem ficar na área de mercearia), leites vegetais;
                        "Frios e laticínios",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linhas(itR2, context),
                    const Align(
                      //Linha: 3 --------------------------------------------------------------------------------
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        // podem ter produtos de fabricação própria ou não, pães, bolos, salgados, doces caseiros, panetones;
                        "Padaria e confeitaria",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linhas(itR3, context),
                    const Align(
                      //Linha: 4 --------------------------------------------------------------------------------
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        /// chocolates, biscoitos, bolachas, balas.
                        "Biscoitos e doces",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linhas(itR4, context),
                    const Align(
                      //Linha: 5 --------------------------------------------------------------------------------
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        // farinhas, arroz, feijão, óleo, macarrão, molhos, temperos, massas prontas para bolo, leites e enlatados em alguns supermercados;
                        "Mercearia",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linhas(itR5, context),
                  ],
                ),
              ))),
    );
  }
}
