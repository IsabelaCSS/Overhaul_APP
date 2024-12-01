 // ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:overhaul/models/ProductCard.dart';
import 'package:overhaul/models/marcas.dart';
import 'models/carro.dart'; // Atualize para este caminho
import 'DetalhesCarro.dart';
import 'Vertudo.dart';

// Seu código continua sem mudanças adicionais.


  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Overhaul',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(234, 234, 234, 234),
        ),
        home: const HomePage(),
      );
    }
  }

  class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    _HomePageState createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    final controller = TextEditingController();
    List<Carros> carros = allCarros;
    String query = '';

    // Cria uma sublista dos 4 principais carros para exibição principal
    List<Carros> mainCarros = allCarros.take(4).toList();

    void pesquisaCar(String query) {
      final suggestion = allCarros.where((carro) {
        final carroNome = carro.nome.toLowerCase();
        final input = query.toLowerCase();
        return carroNome.contains(input);
      }).toList();

      setState(() {
        this.query = query;
        carros = suggestion;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Logo
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 140,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
              ),
              // Barra de pesquisa
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Pesquisar carros',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    onChanged: pesquisaCar,
                  ),
                ),
              ),
              // Lista de carros pesquisados
              
              if (query.isNotEmpty)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: carros.length,
                    itemBuilder: (context, index) {
                      final carro = carros[index];
                      return ListTile(
                        leading: Image.asset(
                          carro.image,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 90,
                        ),
                        title: Text(carro.nome),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(carro.preco, style: TextStyle(color: const Color.fromARGB(255, 72, 72, 72))),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow, size: 16),
                                Text(carro.avaliacao.toString(), style: TextStyle(color: const Color.fromARGB(255, 73, 73, 73))),
                              ],
                            ),
                          ],
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesCarro(carro: carro),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 30),
              const Text(
                'Marcas parceiras',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 69, 69, 69),
                ),
              ),
              const SizedBox(height: 10),
              // Scroll de marcas parceiras
              Marcas(),
              const SizedBox(height: 20),
              // Divisão para os produtos
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 20.0),
                          child: Text(
                            'Mais Vendidos',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Vertudo()),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 30.0, top: 25.0),
                            child: Text(
                              'Ver Tudo',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 56, 56, 56),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                      physics: const NeverScrollableScrollPhysics(), // Exibe apenas os 4 principais carros
                      padding: const EdgeInsets.symmetric(horizontal: 12.0), // Margem lateral
                      children: mainCarros.map((carro) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalhesCarro(carro: carro),
                              ),
                            );
                          },
                          child: ProductCard(
                            imagePath: carro.image,
                            productName: carro.nome,
                            preco: carro.preco,
                            avaliacao: carro.avaliacao,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 11, 11, 11),
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: const Column(
                        children: [
                          Text(
                            'O V E R H A U L',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Transforme seu caminho com inovação e\nsustentabilidade!',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Faça uma visita',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Avenida Giovanni Gronchi, 2967\nMorumbi, São Paulo - SP',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Fale Conosco',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'overhaul@gmail.com\n(11) 3675-5436',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

