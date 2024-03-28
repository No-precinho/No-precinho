import 'package:flutter/material.dart';
import './rowsInten.dart';

class Inc extends StatefulWidget {
  @override
  _Inc createState() => _Inc();
}

const String imgUrl =
    'https://image.cdn2.seaart.ai/2024-03-01/cnh3ec5e878c738rbgf0/ba8d5cc37c75f4d301038456f9fe21a4468e7662_high.webp';
String title = 'Bebidas';
String descricao = '7,39 R\$ \nHeineken_330ml';

class _Inc extends State<Inc> {
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
                child: Column(
                  children: [
                    Align(
                      //Linha: 1
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linePage(imgUrl, title, descricao),
                    Align(
                      //Linha: 2
                      //alignment: Alignment.bottomLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linePage(imgUrl, title, descricao),
                    Align(
                      //Linha: 3
                      //alignment: Alignment.bottomLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linePage(imgUrl, title, descricao),
                    Align(
                      //Linha: 4
                      //alignment: Alignment.bottomLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linePage(imgUrl, title, descricao),
                    Align(
                      //Linha: 5
                      //alignment: Alignment.bottomLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    linePage(imgUrl, title, descricao),
                  ],
                ),
              ))),
    );
  }
}
