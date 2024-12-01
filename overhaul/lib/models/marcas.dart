import 'package:flutter/material.dart';

  class Marcas extends StatelessWidget {
    final List<String> images = [
      'assets/bmw.png',
      'assets/mercedes.png',
      'assets/nissan.png',
      'assets/toyota.png',
      'assets/audi.png',
    ];

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 4.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
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
