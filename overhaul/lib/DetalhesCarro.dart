  // ignore_for_file: file_names, unused_import

  import 'package:flutter/material.dart';
  import 'package:overhaul/main.dart';
  import 'package:url_launcher/url_launcher.dart';
  import 'package:overhaul/ItensAdicionais.dart';
  import 'package:overhaul/globais.dart' as globals;
import 'models/carro.dart'; // Atualize para este caminho

  class DetalhesCarro extends StatelessWidget {
    final Carros carro;

    const DetalhesCarro({super.key, required this.carro});
    

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
              Navigator.pop(context);
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
                carro.image, // Imagem do carro
                width: 440,
                height: 320,
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
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        '  ${carro.nome}', // Nome do carro
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 0),
                          Text(
                            '     Modelo: ${carro.modelo}', // Modelo do carro
                            style: const TextStyle(fontSize: 17),
                          ),
                          Text(
                            '     Preço: ${carro.preco}', // Preço do carro
                            style: const TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(width: 5),
                          Text('(${carro.avaliacao})         '), // Avaliação do carro
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Cor:                               ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: carro.cores
                                  .map((color) => ColorOption(color)) // Cores do carro
                                  .toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.grey, thickness: 1),
                    const SizedBox(height: 16),
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
                    Text(
                      carro.descricao, // Descrição do carro
                      style: const TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.grey, thickness: 1),
                    const SizedBox(height: 16),
                     Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            globals.currentCarro = carro; // va global
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItensAdicionais(carro: carro),
                              ),
                            );
                          },
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
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            globals.currentCarro = carro;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItensAdicionais(carro: carro),
                              ),
                            );
                          },
                          child: const Text(
                            'Itens Adicionais >',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
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
