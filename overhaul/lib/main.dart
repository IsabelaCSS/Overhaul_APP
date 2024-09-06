import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overhaul',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(234, 234, 234, 234),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 140,
                height: 120, // Reduzi a altura da logo
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
            ),
            // Espaço entre a logo e a barra de pesquisa
            const SizedBox(height: 0), // Espaçamento adequado
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
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            // Texto abaixo da barra de pesquisa
            const SizedBox(height: 30),
            const Text(
              'Marcas parceiras',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 69, 69, 69),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento adequado
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BrandIcon('assets/logo.png'),
                  BrandIcon('assets/logo.png'),
                  BrandIcon('assets/logo.png'),
                ],
              ),
            ),
            const SizedBox(height: 30), // Espaçamento adequado entre os blocos
            // Divisão para os produtos
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)), // Bordas arredondadas no topo
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(30.0),
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
                              MaterialPageRoute(builder: (context) => const Vertudo()),
                            );
                          },
                        child: const Padding(
                          padding: EdgeInsets.all(30.0),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.count(
                      shrinkWrap: true, // Evita o scroll dentro do GridView
                      crossAxisCount: 2, // Duas colunas
                      mainAxisSpacing: 10, // Espaçamento vertical entre os itens
                      crossAxisSpacing: 10, // Espaçamento horizontal entre os itens
                      childAspectRatio: 0.75, // Proporção do card
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProductPage1()),
                            );
                          },
                          child: const ProductCard(
                            imagePath: 'assets/logo.png',
                            productName: 'Renault Kwid',
                            price: 'R\$45.000',
                            rating: 4.5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProductPage2()),
                            );
                          },
                          child: const ProductCard(
                            imagePath: 'assets/logo.png',
                            productName: 'Volkswagen Polo',
                            price: 'R\$55.000',
                            rating: 4.7,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProductPage3()),
                            );
                          },
                          child: const ProductCard(
                            imagePath: 'assets/logo.png',
                            productName: 'Fiat Argo',
                            price: 'R\$50.000',
                            rating: 4.6,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProductPage4()),
                            );
                          },
                          child: const ProductCard(
                            imagePath: 'assets/logo.png',
                            productName: 'Ford Ka',
                            price: 'R\$48.000',
                            rating: 4.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Espaçamento entre a grid e o rodapé
                  Container(
                    color: const Color.fromARGB(255, 11, 11, 11),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
                      child: Column(
                        children: [
                          Text(
                            'OVERHAUL',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandIcon extends StatelessWidget {
  final String imagePath;

  const BrandIcon(this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      backgroundImage: AssetImage(imagePath),
    );
  }
}

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
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.contain, height: 180, width: double.infinity),
            const SizedBox(height: 10),
            Text(
              productName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              price,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow[700], size: 18),
                Text(
                  '$rating',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Exemplo de tela de produto específica
class ProductPage1 extends StatelessWidget {
  const ProductPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renault Kwid'),
      ),
      body: const Center(
        child: Text('Detalhes do Renault Kwid'),
      ),
    );
  }
}

class ProductPage2 extends StatelessWidget {
  const ProductPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volkswagen Polo'),
      ),
      body: const Center(
        child: Text('Detalhes do Volkswagen Polo'),
      ),
    );
  }
}

class ProductPage3 extends StatelessWidget {
  const ProductPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fiat Argo'),
      ),
      body: const Center(
        child: Text('Detalhes do Fiat Argo'),
      ),
    );
  }
}

class ProductPage4 extends StatelessWidget {
  const ProductPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ford Ka'),
      ),
      body: const Center(
        child: Text('Detalhes do Ford Ka'),
      ),
    );
  }
}

class Vertudo extends StatelessWidget {
  const Vertudo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carros'),
      ),
      body: const Center(
        child: Text('Todos os carros disponiveis'),
      ),
    );
  }
}