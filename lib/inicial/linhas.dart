import 'package:flutter/material.dart';
import '../produto/prodPrinc.dart';
/*
class linhas extends StatefulWidget {
  String imgUrl = '';
  String title = '';
  String descricao = '';
  linhas(this.imgUrl, this.title, this.descricao);

  @override
  _linhas createState() => _linhas(imgUrl, title, descricao);
}
*//*
class linhas extends StatelessWidget {
  String imgUrl = '';
  String title = '';
  String descricao = '';
  linhas(this.imgUrl, this.title, this.descricao);

  @override*/
  Widget linhas(String imgUrl, String title, String descricao, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        //padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // iten 1
            GestureDetector(
              onTap: () {
                VoidCallbackAction();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => prodClass(imgUrl, title, descricao),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 30,),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imgUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      descricao,
                      style: const TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            // iten 2
            GestureDetector(
              onTap: () {
                VoidCallbackAction();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => prodClass(imgUrl, title, descricao),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 30,),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imgUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      descricao,
                      style: const TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            // iten 3
            GestureDetector(
              onTap: () {
                VoidCallbackAction();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => prodClass(imgUrl, title, descricao),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 30,),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imgUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      descricao,
                      style: const TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            // iten 4
            GestureDetector(
              onTap: () {
                VoidCallbackAction();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => prodClass(imgUrl, title, descricao),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 30,),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imgUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      descricao,
                      style: const TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            // iten 5
            GestureDetector(
              onTap: () {
                VoidCallbackAction();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => prodClass(imgUrl, title, descricao),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,fontSize: 30,),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imgUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      descricao,
                      style: const TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//}
