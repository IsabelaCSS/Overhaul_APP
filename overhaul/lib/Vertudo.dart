// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:overhaul/DetalhesCarro.dart';
import 'package:overhaul/main.dart';

void main() {
  runApp(Vertudo());
}

class Vertudo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarListPage(),
    );
  }
}

class CarListPage extends StatelessWidget {
  final List<Car> cars = [
    Car(name: 'Renault Kwid', year: 2019, price: 45000, rating: 4.5, imageUrl: 'assets/renautkwid2.png'),
    Car(name: 'Fiat Argo', year: 2020, price: 52000, rating: 4.2, imageUrl: 'assets/renautkwid2.png'),
    Car(name: 'Chevrolet Onix', year: 2021, price: 60000, rating: 4.8, imageUrl: 'assets/renautkwid2.png'),
    Car(name: 'Chevrolet Onix', year: 2021, price: 60000, rating: 4.8, imageUrl: 'assets/renautkwid2.png'),
    Car(name: 'Chevrolet Onix', year: 2021, price: 60000, rating: 4.8, imageUrl: 'assets/renautkwid2.png'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
                Spacer(),
                Text(
                  'Carros',
                  style: TextStyle(fontSize: 24),
                ),
                Spacer(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
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
                    icon: Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 8,
                    child: Container(
                      padding: EdgeInsets.all(0),
                      height: 240, // Ajusta a altura do card para acomodar a imagem maior
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.only(top: 10, left: 0, right: 10),
                            leading: ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Image.asset(
    car.imageUrl,
    width: 220,  // Adjust width as per your requirement
    height: 200, // Adjust height as per your requirement
    fit: BoxFit.contain, // Use BoxFit.contain to prevent cropping
  ),
),


                            title: Text(
                              car.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            subtitle: Text(
                              'Modelo: ${car.year}\nPreço: \$${car.price}',
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text('${car.rating}'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      if (car.name == 'Renault Kwid') {
                                        return DetalhesCarro();
                                      } else if (car.name == 'Fiat Argo') {
                                        return DetalhesCarro();
                                      } else if (car.name == 'Chevrolet Onix') {
                                        return DetalhesCarro();
                                      }
                                      return Container();
                                    },
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 0, left: 5, right: 5),
                                child: Text(
                                  'Ver detalhes',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class Car {
  final String name;
  final int year;
  final int price;
  final double rating;
  final String imageUrl;

  Car({
    required this.name,
    required this.year,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });
}
