// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:overhaul/DetalhesCarro.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const ItensAdicionais());
}

class ItensAdicionais extends StatelessWidget {
  const ItensAdicionais({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarDetailsPage(),
    );
  }
}

class CarDetailsPage extends StatelessWidget {
  final String url = 'https://drive.google.com/file/d/1D1njOUcKSaS-bV20uX8S2KV1t_FnsQMr/view?usp=sharing';

  const CarDetailsPage({super.key});

  void _launchURL() async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
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
              MaterialPageRoute(builder: (context) => const DetalhesCarro()),
            );
          },
        ),
        title: const Center(
          child: Text(
            'Itens Adicionais',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/renautkwid.png', // Trocar pela imagem do carro
              width: 370,
              height: 280,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          '   Renault Kwid           ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28, // Ajustando o tamanho da fonte do título
                          ),
                        ),
                        SizedBox(width: 10), // Espaço entre o nome e a estrela
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 5), // Pequeno espaço entre a estrela e a nota
                        Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '     • Detecção de ponto cego (BSD)\n'
                      '     • Sistema de freio motorizado inteligente\n'
                      '     • Monitoramento da fadiga do motorista (DFM)\n'
                      '     • Reconhecimento de sinais de trânsito (TSR)\n'
                      '     • Trava manual de segurança para crianças\n'
                      '     • Detecção de ponto cego (BSD)\n'
                      '     • Sistema de freio motorizado inteligente\n'
                      '     • Monitoramento da fadiga do motorista (DFM)\n'
                      '     • Reconhecimento de sinais de trânsito (TSR)\n'
                      '     • Trava manual de segurança para crianças',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 44),
                    Center(
                      child: ElevatedButton(
                        onPressed: _launchURL,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Cor de fundo do botão
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Marcar Test Drive',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30), // Espaço entre o botão e a imagem
                    Center(
                      child: Image.asset(
                        'assets/logo.png', // Imagem do carro agora abaixo do botão
                        width: 100, // Ajuste a largura conforme necessário
                        height: 30, // Ajuste a altura conforme necessário
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
