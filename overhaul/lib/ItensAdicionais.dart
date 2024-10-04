// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:overhaul/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ItensAdicionais extends StatelessWidget {
  final Carros carro;

  const ItensAdicionais({Key? key, required this.carro}) : super(key: key);

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
            'Itens Adicionais',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/renautkwid.png',
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
                    Row(
                      children: [
                        Text(
                          '${carro.nome}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 5),
                        const Text(
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
                      '     • Trava manual de segurança para crianças',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 44),
                    Center(
                      child: ElevatedButton(
                        onPressed: _launchURL,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
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
                    const SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        'assets/logo.png',
                        width: 100,
                        height: 30,
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

  void _launchURL() async {
    const String url = 'https://drive.google.com/file/d/1D1njOUcKSaS-bV20uX8S2KV1t_FnsQMr/view?usp=drive_link';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
