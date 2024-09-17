// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:overhaul/ItensAdicionais.dart';
import 'package:overhaul/Vertudo.dart';
import 'package:url_launcher/url_launcher.dart'; // Importar o pacote url_launcher

void main() {
  runApp(const DetalhesCarro());
}

class DetalhesCarro extends StatelessWidget {
  const DetalhesCarro({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RenaultKwidPage(),
    );
  }
}

class RenaultKwidPage extends StatelessWidget {
  const RenaultKwidPage({super.key});

  // Função para abrir o link
  void _launchURL() async {
    final Uri url = Uri.parse(
        'https://drive.google.com/file/d/1D1njOUcKSaS-bV20uX8S2KV1t_FnsQMr/view?usp=drive_link');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      }
        }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
           onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Vertudo()),
                      );
                  },
        ),
        title: const Center(
          child: Text(
            'Detalhes do Carro',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/renautkwid.png', // Trocar pela imagem do carro
              width: 370,
              height: 280,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      '  Renault Kwid',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28, // Ajustando o tamanho da fonte do título
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 0),
                        Text(
                          '     Modelo: 2019',
                          style: TextStyle(fontSize: 17), // Tamanho da fonte do modelo
                        ),
                        Text(
                          '     Preço: \$45.000',
                          style: TextStyle(fontSize: 17), // Tamanho da fonte do preço
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 5),
                        Text('(4.5)         '),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Alinhar "Cor" e as opções de cores à direita
                  const Row(
                    children: [
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Cor:                               ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              ColorOption(Colors.brown),
                              ColorOption(Colors.blue),
                              ColorOption(Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Linha separadora entre as cores e a descrição
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  const SizedBox(height: 16),
                  // Centralizar o texto "Descrição"
                  const Center(
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    style: TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _launchURL, // Usar a função para abrir o link
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Comprar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Adicionar navegação para a tela "Itens Adicionais"
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ItensAdicionais(),
                            ),
                          );
                        },
                        child: Text(
                          'Itens Adicionais >',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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

class ColorOption extends StatelessWidget {
  final Color color;

  const ColorOption(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
    );
  }
}

