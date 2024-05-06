import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class itenc {
  String id = "";
  String imgUr =
      'https://image.cdn2.seaart.ai/2024-03-01/cnh3ec5e878c738rbgf0/ba8d5cc37c75f4d301038456f9fe21a4468e7662_high.webp';
  String category = "Adega e bebidas";
  String title = "Vinho Tinto";
  String nomecomplet = "Vinho Tinto Reserva Cabernet Sauvignon ";
  //  "Este vinho tinto encorpado é produzido a partir de uvas Cabernet Sauvignon cuidadosamente selecionadas. Possui notas intensas de frutas vermelhas maduras, taninos macios e um final persistente. Ideal para acompanhar carnes grelhadas e queijos fortes.";
  String preco = "R\$ 80.00";
  double precoR = 80.00;
}

class itensRowc {
  int codebarid = 0;
  String idSuperMec = "BH";
  List<itenc> it1 = [];
  itenc it2 = itenc();
  itenc it3 = itenc();
  itenc it4 = itenc();
  itenc it5 = itenc();

  void addGerar(String n, String img, String cat) {
    // Obtém uma referência para a coleção de usuários
    CollectionReference ref = FirebaseFirestore.instance.collection('products');

    // Cria um novo documento com os dados do usuário
    ref.add({
      "name": n,
      "image": img,
      "category": cat,
    }).then((value) {
      print("Produto adicionado com sucesso! ID do documento: ${value.id}");
    }).catchError((error) {
      print("Erro ao adicionar produto: $error");
    });
  }
/*
  void addGerar(String n, String img, String cat) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("products/$codebarid");
    await ref.set({
      "name": n,
      "image": img,
      "category": cat,
    });
  }*/

  void adcomp() {
    // gera produtos base
    addGerar(
        "Heineken_330ml",
        "https://cdn.awsli.com.br/2500x2500/2371/2371659/produto/169355378/304ad436dd.jpg",
        "Adega e bebidas");
    codebarid++;
    addGerar(
        "Vinho Tinto",
        "https://cdn.awsli.com.br/2500x2500/1377/1377751/produto/156502978/ad15e54743.jpg",
        "Adega e bebidas");
    codebarid++;
    addGerar(
        "Gin Artesanal",
        "https://cdn.awsli.com.br/800x800/91/91186/produto/54300587/3df62b9a42.jpg",
        "Adega e bebidas");
    codebarid++;
    addGerar(
        "Whisky Single",
        "https://cdn.iset.io/assets/50100/produtos/24/jack1.jpg",
        "Adega e bebidas");
    codebarid++;
    addGerar(
        "Vodka Premium",
        "https://adegabrooklin.com.br/wp-content/uploads/2023/01/Vodka-Absolut-1-litrook.png",
        "Adega e bebidas");
    codebarid++;
    addGerar(
        "Queijo Gorgonzola",
        "https://io.convertiez.com.br/m/superpaguemenos/shop/products/images/18865/medium/queijo-gorgonzola-tirolez-kg_76422.png",
        "Frios e laticínios");
    codebarid++;
    addGerar(
        "Presunto Parma",
        "https://static.paodeacucar.com/img/uploads/1/62/658062.png",
        "Frios e laticínios");
    codebarid++;
    addGerar(
        "Iogurte Grego",
        "https://www.sondadelivery.com.br/img.aspx/sku/1000040209/530/7896051165712.png",
        "Frios e laticínios");
    codebarid++;
    addGerar(
        "Manteiga com Sal",
        "https://tirolez.com.br/wp-content/uploads/tirolezapi/PT-3-11-45Manteiga%20Com%20Sal%20200g.png",
        "Frios e laticínios");
    codebarid++;
    addGerar(
        "Salame Italiano",
        "https://rafasupervarejao.com.br/36972/697-salame-tipo-italiano-sadia-250g.jpg",
        "Frios e laticínios");
    codebarid++;

    addGerar(
        //3
        "Pão Francês",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeMdlRz59OMciIJhtU6ivF7GINbN1cIZncWCGmfDrYiA&s",
        "Padaria e confeitaria");
    codebarid++;
    addGerar(
        //3
        "Croissant de Chocolate",
        "https://static.itdg.com.br/images/1200-630/8e23fd7f8225b98238bba43bd4d142db/croissant-de-chocolate.jpg",
        "Padaria e confeitaria");
    codebarid++;
    addGerar(
        //3
        "Bolo Red Velvet",
        "https://cdn.vnda.com.br/1000x/bisoupartyshop/2022/10/27/20_10_3_359_DDEF0799.jpg?v=1666914621",
        "Padaria e confeitaria");
    codebarid++;
    addGerar(
        //3
        "Torta de Limão",
        "https://cknj.com.br/teste/wp-content/uploads/2021/10/torta-de-limao-01-1200x901.jpg",
        "Padaria e confeitaria");
    codebarid++;
    addGerar(
        //3
        "Pão de Queijo",
        "https://essareceitafunciona.com.br/wp-content/uploads/2022/07/Pao-de-queijo-Essa-Receita-Funciona-9-500x500.jpg",
        "Padaria e confeitaria");
    codebarid++;

    addGerar(
        //4
        "Biscoito Recheado de Chocolate",
        "https://richester.b-cdn.net/wp-content/uploads/2021/01/Recheado-Amori-Chocolate-125g-1.png",
        "Biscoitos e doces");
    codebarid++;
    addGerar(
        //4
        "Brigadeiro Gourmet",
        "https://assets.delirec.com/images%2FUeqVWaiebAOPCtk5KDDUJ6uEnLD2%2Frecipe%2Fc2707086-cc0b-4a1e-828a-d3d521cd5205-Brigadeiro-gourmet--gallery-0",
        "Biscoitos e doces");
    codebarid++;
    addGerar(
        //4
        "Biscoito de Polvilho",
        "https://cdn.awsli.com.br/600x450/1411/1411579/produto/70792492/12dc68d67c.jpg",
        "Biscoitos e doces");
    codebarid++;
    addGerar(
        //4
        "Alfajor Argentino",
        "https://bistroentrecote.com.br/wp-content/uploads/2023/08/Alfajor-Argentino-4.jpg",
        "Biscoitos e doces");
    codebarid++;
    addGerar(
        //4
        "Cookies de Aveia e Passas",
        "https://cdn0.tudoreceitas.com/pt/posts/8/1/5/biscoitos_de_aveia_com_passas_4518_600_square.jpg",
        "Biscoitos e doces");
    codebarid++;

    addGerar(
        //5
        "Arroz Integral",
        "https://static.paodeacucar.com/img/uploads/1/172/11228172.png",
        "Mercearia");
    codebarid++;
    addGerar(
        //5
        "Feijão Preto",
        "https://www.camil.com.br/wp-content/uploads/sites/12/2020/06/1582828742-mkp-feijao-preto-1kg-3-768x768.png",
        "Mercearia");
    codebarid++;
    addGerar(
        //5
        "Azeite de Oliva Extra Virgem",
        "https://loja.cestanobre.com.br/storage/produtos/azeite-de-oliva-extra-virgem-cocinero-250ml-2.webp",
        "Mercearia");
    codebarid++;
    addGerar(
        //5
        "Café em Grãos Pilão",
        "https://m.media-amazon.com/images/I/71f0kaEjrGL._AC_UF1000,1000_QL80_.jpg",
        "Mercearia");
    codebarid++;
    addGerar(
        //5
        "Molho de Tomate Fugini",
        "https://storage.googleapis.com/phygital_files/multimarketcachambi/uploads/produto/ext_tomate_fugini_sache_340g_604e111e-5846-481b-a777-ab20277ed322.thumbnail.png",
        "Mercearia");
    codebarid++;
  }

  void addGerarMercadoria(String codbar, double preco, String supermercado) {
    // Obtém uma referência para a coleção de usuários
    CollectionReference marketProducts =
        FirebaseFirestore.instance.collection('marketProducts');

    // Cria um novo documento com os dados do usuário
    marketProducts.add({
      "codbar": codbar,
      "preco": preco,
      "supermercado": supermercado,
    }).then((value) {
      print(
          "marketProducts adicionado com sucesso! ID do documento: ${value.id}");
    }).catchError((error) {
      print("Erro ao adicionar marketProducts: $error");
    });
  }
/*
  void addGerarMercadoria(
      String codbar, double preco, String supermercado) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("productmercado/$supermercado-$codebarid");
    await ref.set({
      "codbar": codbar,
      "preco": preco,
      "supermercado": supermercado,
    });
  }*/

  void addcompmercado() {
    double a = 12;
    // gera produtos mercadoria
    addGerarMercadoria("$codebarid", 7.39, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria("$codebarid", 80.00, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria("$codebarid", 120.00, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria("$codebarid", 250.00, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria("$codebarid", 150.00, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria("$codebarid", 35.00, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria("$codebarid", 90.00, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria("$codebarid", 6.00, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria("$codebarid", 8.00, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria("$codebarid", 50.00, "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);

    addGerarMercadoria(
        //3
        "$codebarid",
        10.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //3
        "$codebarid",
        5.00,
        "$idSuperMec");
    print('$codebarid');
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //3
        "$codebarid",
        60.00,
        "$idSuperMec");
    print('$codebarid');
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //3
        "$codebarid",
        40.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //3
        "$codebarid",
        25.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);

    addGerarMercadoria(
        //4
        "$codebarid",
        3.50,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //4
        "$codebarid",
        2.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //4
        "$codebarid",
        15.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //4
        "$codebarid",
        4.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //4
        "$codebarid",
        20.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);

    addGerarMercadoria(
        //5
        "$codebarid",
        5.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //5
        "$codebarid",
        8.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //5
        "$codebarid",
        20.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //5
        "$codebarid",
        25.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
    addGerarMercadoria(
        //5
        "$codebarid",
        5.00,
        "$idSuperMec");
    print('$codebarid');
    codebarid++;
    a = sqrt(897);
    a = sqrt(8997);
  }

  void gerador1() {
    /*it1.imgUr =
        'https://cdn.awsli.com.br/2500x2500/2371/2371659/produto/169355378/304ad436dd.jpg';
    it1.category = 'Adega e bebidas';
    it1.precoR = 7.39;
    it1.preco = 'R\$ ${it1.precoR}';
    it1.title = 'Heineken_330ml';
    it1.nomecomplet = 'Heineken_330ml';*/

    it2.imgUr =
        'https://cdn.awsli.com.br/2500x2500/1377/1377751/produto/156502978/ad15e54743.jpg';
    it2.category = 'Adega e bebidas';
    it2.precoR = 80.00;
    it2.preco = 'R\$ ${it2.precoR}';
    it2.title = 'Vinho Tinto';
    it2.nomecomplet = 'Vinho Tinto Reserva Cabernet Sauvignon';

    it3.imgUr =
        'https://cdn.awsli.com.br/800x800/91/91186/produto/54300587/3df62b9a42.jpg';
    it3.category = 'Adega e bebidas';
    it3.precoR = 120.00;
    it3.preco = 'R\$ ${it3.precoR}';
    it3.title = 'Gin Artesanal';
    it3.nomecomplet = 'Gin Artesanal Botanical Blend';

    it4.imgUr = 'https://cdn.iset.io/assets/50100/produtos/24/jack1.jpg';
    it4.category = 'Adega e bebidas';
    it4.precoR = 250.00;
    it4.preco = 'R\$ ${it4.precoR}';
    it4.title = 'Whisky Single';
    it4.nomecomplet = 'Whisky Single Malt 12 Anos';

    it5.imgUr =
        'https://adegabrooklin.com.br/wp-content/uploads/2023/01/Vodka-Absolut-1-litrook.png';
    it5.category = 'Adega e bebidas';
    it5.precoR = 150.00;
    it5.preco = 'R\$ ${it5.precoR}';
    it5.title = 'Vodka Premium';
    it5.nomecomplet = 'Vodka Premium Russian Platinum';
  }

  void gerador(String product, String preco, int index) {
    List<String> p = product.split(" ");
    it1[index].imgUr = p[2];
    it1[index].category = p[3];
    it1[index].precoR = double.parse(preco);
    it1[index].preco = 'R\$ ${it1[index].precoR}';
    it1[index].title = p[0];
    it1[index].nomecomplet = p[0];
  }

  /*void gerador2() {
    it1.imgUr =
        'https://io.convertiez.com.br/m/superpaguemenos/shop/products/images/18865/medium/queijo-gorgonzola-tirolez-kg_76422.png';
    it1.category = 'Frios e laticínios';
    it1.precoR = 35.00;
    it1.preco = 'R\$ ${it1.precoR}/kg';
    it1.title = 'Queijo Gorgonzola';
    it1.nomecomplet = 'Queijo Gorgonzola';

    it2.imgUr = 'https://static.paodeacucar.com/img/uploads/1/62/658062.png';
    it2.category = 'Frios e laticínios';
    it2.precoR = 90.00;
    it2.preco = 'R\$ ${it2.precoR}/kg';
    it2.title = 'Presunto Parma';
    it2.nomecomplet = 'Presunto Parma';

    it3.imgUr =
        'https://www.sondadelivery.com.br/img.aspx/sku/1000040209/530/7896051165712.png';
    it3.category = 'Frios e laticínios';
    it3.precoR = 6.00;
    it3.preco = 'R\$ ${it3.precoR}/unid (500g)';
    it3.title = 'Iogurte Grego';
    it3.nomecomplet = 'Iogurte Grego Natural';

    it4.imgUr =
        'https://tirolez.com.br/wp-content/uploads/tirolezapi/PT-3-11-45Manteiga%20Com%20Sal%20200g.png';
    it4.category = 'Frios e laticínios';
    it4.precoR = 8.00;
    it4.preco = 'R\$ ${it4.precoR}/uni (200g)';
    it4.title = 'Manteiga com Sal';
    it4.nomecomplet = 'Manteiga com Sal';

    it5.imgUr =
        'https://rafasupervarejao.com.br/36972/697-salame-tipo-italiano-sadia-250g.jpg';
    it5.category = 'Frios e laticínios';
    it5.precoR = 50.00;
    it5.preco = 'R\$ ${it5.precoR}/kg';
    it5.title = 'Salame Italiano';
    it5.nomecomplet = 'Salame Italiano';
  }

  void gerador3() {
    it1.imgUr =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeMdlRz59OMciIJhtU6ivF7GINbN1cIZncWCGmfDrYiA&s';
    it1.category = 'Padaria e confeitaria';
    it1.precoR = 10.00;
    it1.preco = 'R\$ ${it1.precoR}/kg';
    it1.title = 'Pão Francês';
    it1.nomecomplet = 'Pão Francês';

    it2.imgUr =
        'https://static.itdg.com.br/images/1200-630/8e23fd7f8225b98238bba43bd4d142db/croissant-de-chocolate.jpg';
    it2.category = 'Padaria e confeitaria';
    it2.precoR = 5.00;
    it2.preco = 'R\$ ${it2.preco}/unid';
    it2.title = 'Croissant';
    it2.nomecomplet = 'Croissant de Chocolate';

    it3.imgUr =
        'https://cdn.vnda.com.br/1000x/bisoupartyshop/2022/10/27/20_10_3_359_DDEF0799.jpg?v=1666914621';
    it3.category = 'Padaria e confeitaria';
    it3.precoR = 60.00;
    it3.preco = 'R\$ ${it3.precoR}/unid';
    it3.title = 'Bolo Red Velvet';
    it3.nomecomplet = 'Bolo Red Velvet';

    it4.imgUr =
        'https://cknj.com.br/teste/wp-content/uploads/2021/10/torta-de-limao-01-1200x901.jpg';
    it4.category = 'Padaria e confeitaria';
    it4.precoR = 40.00;
    it4.preco = 'R\$ ${it4.precoR}/unid';
    it4.title = 'Torta de Limão';
    it4.nomecomplet = 'Torta de Limão';

    it5.imgUr =
        'https://essareceitafunciona.com.br/wp-content/uploads/2022/07/Pao-de-queijo-Essa-Receita-Funciona-9-500x500.jpg';
    it5.category = 'Padaria e confeitaria';
    it5.precoR = 25.00;
    it5.preco = 'R\$ ${it5.precoR}/kg';
    it5.title = 'Pão de Queijo';
    it5.nomecomplet = 'Pão de Queijo';
  }

  void gerador4() {
    it1.imgUr =
        'https://richester.b-cdn.net/wp-content/uploads/2021/01/Recheado-Amori-Chocolate-125g-1.png';
    it1.category = 'Biscoitos e doces';
    it1.precoR = 3.50;
    it1.preco = 'R\$ ${it1.precoR}/pac (150g)';
    it1.title = 'Biscoito Recheado';
    it1.nomecomplet = 'Biscoito Recheado de Chocolate';

    it2.imgUr =
        'https://assets.delirec.com/images%2FUeqVWaiebAOPCtk5KDDUJ6uEnLD2%2Frecipe%2Fc2707086-cc0b-4a1e-828a-d3d521cd5205-Brigadeiro-gourmet--gallery-0';
    it2.category = 'Biscoitos e doces';
    it2.precoR = 2.00;
    it2.preco = 'R\$  ${it2.precoR}/unid';
    it2.title = 'Brigadeiro Gourmet';
    it2.nomecomplet = 'Brigadeiro Gourmet';

    it3.imgUr =
        'https://cdn.awsli.com.br/600x450/1411/1411579/produto/70792492/12dc68d67c.jpg';
    it3.category = 'Biscoitos e doces';
    it3.precoR = 15.00;
    it3.preco = 'R\$ ${it3.precoR}/kg';
    it3.title = 'Biscoito de Polvilho';
    it3.nomecomplet = 'Biscoito de Polvilho';

    it4.imgUr =
        'https://bistroentrecote.com.br/wp-content/uploads/2023/08/Alfajor-Argentino-4.jpg';
    it4.category = 'Biscoitos e doces';
    it4.precoR = 4.00;
    it4.preco = 'R\$ ${it4.precoR}/unid';
    it4.title = 'Alfajor Argentino';
    it4.nomecomplet = 'Alfajor Argentino';

    it5.imgUr =
        'https://cdn0.tudoreceitas.com/pt/posts/8/1/5/biscoitos_de_aveia_com_passas_4518_600_square.jpg';
    it5.category = 'Biscoitos e doces';
    it5.precoR = 20.00;
    it5.preco = 'R\$ ${it5.precoR}/pac (250g)';
    it5.title = 'Cookies de Aveia';
    it5.nomecomplet = 'Cookies de Aveia e Passas';
  }

  void gerador5() {
    it1.imgUr = 'https://static.paodeacucar.com/img/uploads/1/172/11228172.png';
    it1.category = 'Mercearia';
    it1.precoR = 5.00;
    it1.preco = 'R\$ ${it1.precoR}/kg';
    it1.title = 'Arroz Integral';
    it1.nomecomplet = 'Arroz Integral';

    it2.imgUr =
        'https://www.camil.com.br/wp-content/uploads/sites/12/2020/06/1582828742-mkp-feijao-preto-1kg-3-768x768.png';
    it2.category = 'Mercearia';
    it2.precoR = 8.00;
    it2.preco = 'R\$  ${it2.precoR}/kg';
    it2.title = 'Feijão Preto';
    it2.nomecomplet = 'Feijão Preto';

    it3.imgUr =
        'https://loja.cestanobre.com.br/storage/produtos/azeite-de-oliva-extra-virgem-cocinero-250ml-2.webp';
    it3.category = 'Mercearia';
    it3.precoR = 20.00;
    it3.preco = 'R\$ ${it3.precoR}/(500ml)';
    it3.title = 'Azeite de Oliva';
    it3.nomecomplet = 'Azeite de Oliva Extra Virgem';

    it4.imgUr =
        'https://m.media-amazon.com/images/I/71f0kaEjrGL._AC_UF1000,1000_QL80_.jpg';
    it4.category = 'Mercearia';
    it4.precoR = 25.00;
    it4.preco = 'R\$ ${it4.precoR}/kg';
    it4.title = 'Café em Grãos Pilão';
    it4.nomecomplet = 'Café em Grãos Pilão';

    it5.imgUr =
        'https://storage.googleapis.com/phygital_files/multimarketcachambi/uploads/produto/ext_tomate_fugini_sache_340g_604e111e-5846-481b-a777-ab20277ed322.thumbnail.png';
    it5.category = 'Mercearia';
    it5.precoR = 5.00;
    it5.preco = 'R\$ ${it5.precoR}/(500g)';
    it5.title = 'Molho de Tomate Fugini';
    it5.nomecomplet = 'Molho de Tomate Fugini';
    
  }*/

  map(Widget Function(dynamic product) param0) {}
}
