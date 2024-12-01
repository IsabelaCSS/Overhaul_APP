import 'package:flutter/material.dart';

  class ProductCard extends StatelessWidget {
    final String imagePath;
    final String productName;
    final String preco;
    final double avaliacao;

    const ProductCard({
      super.key,
      required this.imagePath,
      required this.productName,
      required this.preco,
      required this.avaliacao,
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
    Row(
      children: [
        Expanded(
          child: Text(
            productName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [   
            const Icon(Icons.star, color: Colors.yellow, size: 16),
            const SizedBox(height: 25),
            Text(
              avaliacao.toString(),
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 70, 70, 70),
              ),
            ),
          ],
        ),
      ],
    ),
    Text(
      preco,
      style: const TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 70, 70, 70),
      ),
    ),
    const SizedBox(height: 10),
  ],
),

            ),
          ],
            ),
      ); 
    }
  }
