import 'package:flutter/material.dart';
import 'package:overhaul/DetalhesCarro.dart';
import 'package:overhaul/Vertudo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debug retirado com sucesso
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
  String query =
      ''; // Armazena a consulta de pesquisa e tbm permite que ele exiba apenas qnd tiver uma interação

  void pesquisaCar(String query) {
    final suggestion = allCarros.where((carro) {
      final carroNome = carro.nome.toLowerCase();
      final input = query.toLowerCase();
      return carroNome.contains(input);
    }).toList();

    setState(() {
      this.query =
          query; // Atualiza conforme a pesquisa e vai mostrando as sugtoes
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

            // Barra de pesquisa yo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // so charme it's not real
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
                  onChanged:
                      pesquisaCar, // Atualiza a pesquisa, e madeira facil de explicar a cada letra digitada
                ),
              ),
            ),

            // Lista de carros pesquisados
            if (query.isNotEmpty) // exibe a listinha apenas se tiver algo nela
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: carros.length,
                  itemBuilder: (context, index) {
                    final carro = carros[index];

                    return ListTile(
                      leading: Image.network(
                        carro.image,
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                      title: Text(carro.nome),
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

            // Scroll marcas parceiras
            Marcas(), // add um scroll so pra ficar bunitin

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
                        padding: EdgeInsets.only(left: 30.0, top: 30.0),
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
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalhesCarro(
                                  carro: allCarros[
                                      0]), // passa o carro correspondente vou adicionar a listinha to com preguiça agr
                            ),
                          );
                        },
                        child: const ProductCard(
                          imagePath: 'assets/renautkwid.png',
                          productName: 'Renault Kwid',
                          price: 'R\$45.000',
                          rating: 4.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalhesCarro(
                                  carro: allCarros[
                                      0]), // passa o carro correspondente vou adicionar a listinha to com preguiça agr
                            ),
                          );
                        },
                        child: const ProductCard(
                          imagePath: 'assets/renautkwid.png',
                          productName: 'Renault Kwid',
                          price: 'R\$45.000',
                          rating: 4.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalhesCarro(
                                  carro: allCarros[
                                      0]), // passa o carro correspondente vou adicionar a listinha to com preguiça agr
                            ),
                          );
                        },
                        child: const ProductCard(
                          imagePath: 'assets/renautkwid.png',
                          productName: 'Renault Kwid',
                          price: 'R\$45.000',
                          rating: 4.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalhesCarro(
                                  carro: allCarros[
                                      0]), // passa o carro correspondente vou adicionar a listinha to com preguiça agr
                            ),
                          );
                        },
                        child: const ProductCard(
                          imagePath: 'assets/renautkwid.png',
                          productName: 'Renault Kwid',
                          price: 'R\$45.000',
                          rating: 4.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width, // add um mediaquery para o container oculpar toda a tela, "ficando" responsivokkk
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
                          'Transforme seu caminho com inovação e sustentabilidade!',
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
                          'Avenida Giovanni Gronchi, 2967 - Morumbi, São Paulo - SP',
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
    'assets/bmw.png', // estarei trocando em sala mo preguiça 
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP7yfHtJifPsdJtX3c-9LWyfcjt07JaTlmfg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP7yfHtJifPsdJtX3c-9LWyfcjt07JaTlmfg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP7yfHtJifPsdJtX3c-9LWyfcjt07JaTlmfg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP7yfHtJifPsdJtX3c-9LWyfcjt07JaTlmfg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP7yfHtJifPsdJtX3c-9LWyfcjt07JaTlmfg&s',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white, // so charme it's not real
                  blurRadius: 6.0,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
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

// Modelos e lista de carros
class Carros {
  final String nome;
  final String image;

  Carros({required this.nome, required this.image});
}

List<Carros> allCarros = [
  Carros(
    nome: 'Billie red hair',
    image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0PBg0XUkyH4aLL69tuCXRQSK35Xif4MjdYlSNcGKlC2YP7fKUODDS1JZPjflb6EruwK0&usqp=CAU',
  ),
  Carros(
    nome: 'Billie green hair',
    image: 'https://media.cnn.com/api/v1/images/stellar/prod/210317181128-billie-eilish-file-2020.jpg?q=w_2163,h_1380,x_0,y_0,c_fill',
  ),
  Carros(
      nome: 'Billie blue hair',
      image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ9CZO_1RQQL9BPRFjJgLnlzKQVPf97HooGw&s'),
  Carros(
      nome: 'Billie gray hair',
      image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCLqSKDiOHJuYLKbwESbKJC26YFg_s3-eeGQ&s'),
  Carros(
      nome: 'Billie blonde hair',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXNc2DGfH8xjAFm9JCwJchlZvUQqzaajEqGj77FyNoq7Bs8KwnRSxp37bRPnnELfiZw2I&usqp=CAU'),
  Carros(
      nome: 'Jimin black hair',
      image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRggVwWMf6g6pPaltytcB4E3YnzzAQHBgxdVg&s'),
  Carros(
      nome: 'Billie black hair',
      image:'https://images.hellomagazine.com/horizon/square/d73349b8f519-billie-eilish-tattoo-dragon.jpg'),
  Carros(
      nome: 'Billie black hair',
      image:'https://media.zenfs.com/en/hypebae_340/3901c6c967afe79b1b769b36e7cc964a'),
  Carros(
      nome: 'Billie black hair',
      image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB6L5vzDL4qjtoqgR2iKy1QKdWfnlcqkUJuy75MAjZaqMWd-4xyHwiGNQJvF6JkLRoFnc&usqp=CAU'),
  Carros(
      nome: 'Jimin pink hair',
      image:'https://64.media.tumblr.com/db1f28f2e3afa1a7246b676da9cb2f85/1a23bf5bd75ae24a-50/s1280x1920/c0be6de565a6aa65ec23e15b77403eb00e0d74fe.jpg'),

  // vou arrumar na sala tbm :) 
];

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;
  final double rating;

  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
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
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 158, 158, 158)),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
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
