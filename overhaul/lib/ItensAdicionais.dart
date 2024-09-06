import 'package:flutter/material.dart';
import 'package:overhaul/DetalhesCarro.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(ItensAdicionais());
}

class ItensAdicionais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarDetailsPage(),
    );
  }
}

class CarDetailsPage extends StatelessWidget {
  final String url = 'https://github.com/giovanavbs/rascunho_tcc';

  void _launchURL() async {
    if (await canLaunch(url)) {
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
          icon: Icon(Icons.arrow_back, color: Colors.white),
         onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetalhesCarro()),
                      );
                  },
        ),
        title: Center(
          child: Text(
            'Itens Adicionais',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png', // Trocar pela imagem do carro
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      '  Renault Kwid',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28, // Ajustando o tamanho da fonte do título
                      ),
                    ),
                  ),
                  Row(
                    children: [
                                            SizedBox(width: 400),

                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  Text(
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
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: _launchURL,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Cor de fundo do botão
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Marcar Test Drive',
                        style: TextStyle(fontSize: 18, color: Colors.black),
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
