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
                        const SizedBox(height: 20), // Espaçamento adequado

            // Logo
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 140,
                height: 100, // Reduzi a altura da logo
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
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                      ),
                    ),
                
                    IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {
                        // Ação do botão de filtro
                      },
                    ),
                  ],
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
            const SizedBox(height: 10), // Espaçamento adequado
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BrandIcon('assets/bmw.png'),
                  BrandIcon('assets/mercedes.png'),
                  BrandIcon('assets/nissan.png'),
                ],
              ),
            ),
            const SizedBox(height: 20), // Espaçamento adequado entre os blocos
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.count(
                      shrinkWrap: true, // Evita o scroll dentro do GridView
                      crossAxisCount: 2, // Duas colunas
                      mainAxisSpacing: 10, // Espaçamento vertical entre os itens
                      crossAxisSpacing: 10, // Espaçamento horizontal entre os itens
                      childAspectRatio: 0.75, // Proporção do card
                      physics: const NeverScrollableScrollPhysics(), // Remove a rolagem
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DetalhesCarro()),
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
                              MaterialPageRoute(builder: (context) => const DetalhesCarro()),
                            );
                          },
                          child: const ProductCard(
                            imagePath: 'assets/renautkwid.png',
                            productName: 'Volkswagen Polo',
                            price: 'R\$55.000',
                            rating: 4.7,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DetalhesCarro()),
                            );
                          },
                          child: const ProductCard(
                            imagePath: 'assets/renautkwid.png',
                            productName: 'Fiat Argo',
                            price: 'R\$50.000',
                            rating: 4.6,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DetalhesCarro()),
                            );
                          },
                          child: const ProductCard(
                            imagePath: 'assets/renautkwid.png',
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
      radius: 60, // Define o tamanho do círculo
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain, // Mantém a proporção da imagem
          width: 150, // Define a largura da imagem dentro do círculo
          height: 150, // Define a altura da imagem dentro do círculo
        ),
      ),
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
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.contain, height: 125, width: double.infinity),
            const SizedBox(height: 1),
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
