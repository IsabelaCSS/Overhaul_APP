// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:overhaul/DetalhesCarro.dart';
import 'package:overhaul/main.dart';

class Vertudo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarListPage(),
    );
  }
}

class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  final controller = TextEditingController();
  List<Car> allCarros = [
    Car(nome: 'Renault Kwid', ano: 2019, preco: 45000, classificacao: 4.5, imageUrl: 'assets/renautkwid2.png'),
    Car(nome: 'Fiat Argo', ano: 2020, preco: 52000, classificacao: 4.2, imageUrl: 'assets/renautkwid2.png'),
    Car(nome: 'Chevrolet Onix', ano: 2021, preco: 60000, classificacao: 4.8, imageUrl: 'assets/renautkwid2.png'),
  ];
  List<Car> filteredCarros = []; // aqui decidi usar a propria lista ja criada pr filtar a pesquisa ficou ate bunitin
  // enfim falando da logica é a mesma do outro kk so to usando a lista q ja tava aq, mudei umas coisa aq e ali nada muito ouhh! mas tem um problema na detalhes na parte de navegação mas sem saco pra ver isso hj
  String query = ''; 

  @override
  void initState() {
    super.initState();
    filteredCarros = allCarros;
  }

  void pesquisaCar(String query) {
    final suggestion = allCarros.where((carro) {
      final carroNome = carro.nome.toLowerCase();
      final input = query.toLowerCase();
      return carroNome.contains(input);
    }).toList();

    setState(() {
      this.query = query; 
      filteredCarros = suggestion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
                Spacer(),
                const Text(
                  'Carros',
                  style: TextStyle(fontSize: 24),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Pesquisar',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      onChanged: pesquisaCar,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCarros.length,
              itemBuilder: (context, index) {
                final carro = filteredCarros[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 8,
                    child: Container(
                      padding: EdgeInsets.only(top: 20, left: 0),
                      height: 265,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  carro.imageUrl,
                                  width: 210,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 15),
                                    Text(
                                      carro.nome,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      'Modelo: ${carro.ano}\nPreço: \$${carro.preco}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.yellow, size: 20),
                                        SizedBox(width: 5),
                                        Text('${carro.classificacao}', style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // aqui começa minha desgraça provavelmente algo besta q to deixando passar 
                          // Center(
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => DetalhesCarro(carro: carro),
                          //         ),
                          //       );
                          //     },
                          //     style: ElevatedButton.styleFrom(
                          //       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                          //       backgroundColor: Colors.black,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(20.0),
                          //       ),
                          //     ),
                          //     child: Padding(
                          //       padding: EdgeInsets.only(top: 0, left: 5, right: 5),
                          //       child: Text(
                          //         'Ver detalhes',
                          //         style: TextStyle(color: Colors.white),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Car {
  final String nome;
  final int ano;
  final int preco;
  final double classificacao;
  final String imageUrl;

  Car({
    required this.nome,
    required this.ano,
    required this.preco,
    required this.classificacao,
    required this.imageUrl,
  });
}
