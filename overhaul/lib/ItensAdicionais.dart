// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:overhaul/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ItensAdicionais extends StatelessWidget {
  final Carros carro;

  const ItensAdicionais({super.key, required this.carro});

 
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: carro.itensAdicionais
                      .map((item) => Text('     • $item', style: const TextStyle(fontSize: 14)))
                      .toList(),
                ),const SizedBox(height: 16),
                  const Divider(color: Colors.grey, thickness: 1),
                  const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _launchURL, // Chamando o método _launchURL ao clicar
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 30, 30, 30), // Cor de fundo ajustada
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Marcar Test Drive',
                      style: TextStyle(fontSize: 18, color: Colors.white), // Ajuste de cor do texto
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

void _launchURL() async {
  final Uri url = Uri.parse('https://lenamenezes.github.io/overhaul-site/test-drive.html#');

  // Verifique se a URL pode ser lançada
  if (await canLaunchUrl(url)) {
    try {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Abre o link no aplicativo externo
      );
    } catch (e) {
      debugPrint('Erro ao tentar abrir a URL: $e');
    }
  } else {
    debugPrint('Não foi possível abrir a URL.');
  }
}


}
