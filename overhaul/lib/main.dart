// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'DetalhesCarro.dart';
import 'Vertudo.dart';

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
                        height: 50,
                        width: 50,
                      ),
                      title: Text(carro.nome),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(carro.price, style: TextStyle(color: Colors.grey[600])),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow, size: 16),
                              Text(carro.rating.toString(), style: TextStyle(color: Colors.grey[600])),
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
                  const SizedBox(height: 0),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                    physics: const NeverScrollableScrollPhysics(),
                    // Exibe apenas os 4 principais carros
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
                          price: carro.price,
                          rating: carro.rating,
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

class Marcas extends StatelessWidget {
  final List<String> images = [
    'assets/bmw.png',
    'assets/mercedes.png',
    'assets/nissan.png',
    'assets/toyota.png',
    'assets/audi.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 4.0,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Carros {
  final String nome;
  final String modelo;
  final String price;
  final double rating;
  final String image;
  final String descricao;
  final List<Color> cores;
  final List<String> itensAdicionais;

  Carros({
    required this.nome,
    required this.modelo,
    required this.price,
    required this.rating,
    required this.image,
    required this.descricao,
    required this.cores,
    required this.itensAdicionais,
  });
}

List<Carros> allCarros = [
  Carros(
    nome: 'Prius',
    modelo: '2021',
    price: 'R\$80.000,00',
    rating: 4.5,
    image: 'assets/prius.png',
    descricao: 'Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industrys standard dummy  text ever since the 1500s, when an unknown printer took a galley of type 15000s.',
    cores: [Colors.blue, Colors.black, Colors.white],
    itensAdicionais: [
      'Detecção de ponto cego (BSD)',
      'Sistema de freio motorizado inteligente',
      'Monitoramento da fadiga do motorista (DFM)',
      'Reconhecimento de sinais de trânsito (TSR)',
      'Trava manual de segurança para crianças',
    ],
  ),
  Carros(
    nome: 'Civic Hybrid',
    modelo: '2022',
    price: 'R\$70.000,00',
    rating: 4.3,
    image: 'assets/CivicHybrid.png',
    descricao: 'Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industrys standard dummy  text ever since the 1500s, when an unknown printer took a galley of type 15000s.',
    cores: [Colors.grey, Colors.black],
    itensAdicionais: [
      'Controle adaptativo de velocidade',
      'Sistema de frenagem automática',
      'Câmera traseira com guias dinâmicas',
      'Assistência de permanência em faixa',
    ],
  ),
  Carros(
    nome: 'Corolla Hybrid',
    modelo: '2023',
    price: 'R\$65.000,00',
    rating: 4.6,
    image: 'assets/Corolla.png',
    descricao: 'Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industrys standard dummy  text ever since the 1500s, when an unknown printer took a galley of type 15000s.',
    cores: [Colors.black, Colors.white],
    itensAdicionais: [
      'Sistema de pré-colisão',
      'Controle eletrônico de estabilidade',
      'Monitoramento de pressão dos pneus',
      'Faróis automáticos de LED',
    ],
  ),
  Carros(
    nome: 'Insight',
    modelo: '2020',
    price: 'R\$45.000,00',
    rating: 4.2,
    image: 'assets/Insight.png',
    descricao: 'Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industrys standard dummy  text ever since the 1500s, when an unknown printer took a galley of type 15000s.',
    cores: [Colors.red, Colors.black, Colors.blue],
    itensAdicionais: [
      'Assistência de partida em subida',
      'Controle de tração e estabilidade',
      'Alerta de ponto cego',
      'Faróis de neblina',
    ],
  ),
    Carros(
    nome: 'Auris Hybrid',
    modelo: '2018',
    price: 'R\$55.000,00',
    rating: 4.9,
    image: 'assets/Auris.png',
    descricao: 'Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industrys standard dummy  text ever since the 1500s, when an unknown printer took a galley of type 15000s.',
    cores: [Colors.red, Colors.black, Colors.grey],
    itensAdicionais: [
      'Assistência de partida em subida',
      'Controle de tração e estabilidade',
      'Alerta de ponto cego',
      'Faróis de neblina',
    ],
  ),
];

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;
  final double rating;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text(rating.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
