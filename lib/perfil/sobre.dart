import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  void abrirUrl() async {
    const url = 'https://github.com/No-precinho/No-precinho';
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Sobre:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 300,
                  child: const Text(
                    'Aplicativo desenvolvido para pesquisa comparativa de preços, oferecendo a descoberta do menor custo para produtos em uma vasta rede de supermercados,  para uma experiência de economia inteligente e conveniente.',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Autores:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text('Luiz Fernando Antunes da Silva Frassi'),
                const Text('Rafael Rodrigues Oliveira'),
                const Text('Yuri de Oliveira Silva'),
                const Text('Caio Ronan Horta'),
                const SizedBox(height: 20),
                const Text(
                  'PUC Minas, 2024',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF6D0CB9)),
                  ),
                  onPressed: () {
                    abrirUrl();
                  },
                  child: const Text(
                    'Visite o projeto no GitHub',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
