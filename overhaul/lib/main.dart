 // ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

  import 'package:flutter/material.dart';
  import 'DetalhesCarro.dart';
  import 'Vertudo.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Overhaul',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(234, 234, 234, 234),
        ),
        home: const HomePage(),
      );
    }
  }

  class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    _HomePageState createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    final controller = TextEditingController();
    List<Carros> carros = allCarros;
    String query = '';

    // Cria uma sublista dos 4 principais carros para exibição principal
    List<Carros> mainCarros = allCarros.take(4).toList();

    void pesquisaCar(String query) {
      final suggestion = allCarros.where((carro) {
        final carroNome = carro.nome.toLowerCase();
        final input = query.toLowerCase();
        return carroNome.contains(input);
      }).toList();

      setState(() {
        this.query = query;
        carros = suggestion;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Logo
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 140,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
              ),
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
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Pesquisar carros',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    onChanged: pesquisaCar,
                  ),
                ),
              ),
              // Lista de carros pesquisados
              
              if (query.isNotEmpty)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: carros.length,
                    itemBuilder: (context, index) {
                      final carro = carros[index];
                      return ListTile(
                        leading: Image.asset(
                          carro.image,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 90,
                        ),
                        title: Text(carro.nome),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(carro.preco, style: TextStyle(color: const Color.fromARGB(255, 72, 72, 72))),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow, size: 16),
                                Text(carro.avaliacao.toString(), style: TextStyle(color: const Color.fromARGB(255, 73, 73, 73))),
                              ],
                            ),
                          ],
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesCarro(carro: carro),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 30),
              const Text(
                'Marcas parceiras',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 69, 69, 69),
                ),
              ),
              const SizedBox(height: 10),
              // Scroll de marcas parceiras
              Marcas(),
              const SizedBox(height: 20),
              // Divisão para os produtos
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 20.0),
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
                    const SizedBox(height: 10),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                      physics: const NeverScrollableScrollPhysics(), // Exibe apenas os 4 principais carros
                      padding: const EdgeInsets.symmetric(horizontal: 12.0), // Margem lateral
                      children: mainCarros.map((carro) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalhesCarro(carro: carro),
                              ),
                            );
                          },
                          child: ProductCard(
                            imagePath: carro.image,
                            productName: carro.nome,
                            preco: carro.preco,
                            avaliacao: carro.avaliacao,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 11, 11, 11),
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: const Column(
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
                            'Transforme seu caminho com inovação e\nsustentabilidade!',
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
                            'Avenida Giovanni Gronchi, 2967\nMorumbi, São Paulo - SP',
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

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

  class Carros {
    final String nome;
    final String modelo;
    final String preco;
    final double avaliacao;
    final String image;
    final String descricao;
    final List<Color> cores;
    final List<String> itensAdicionais;

    Carros({
      required this.nome,
      required this.modelo,
      required this.preco,
      required this.avaliacao,
      required this.image,
      required this.descricao,
      required this.cores,
      required this.itensAdicionais,
    });
  }

  List<Carros> allCarros = [
  Carros(
    nome: 'Prius',
    modelo: '2021',
    preco: 'R\$80.000,00',
    avaliacao: 4.5,
    image: 'assets/prius.png',
    descricao: 'O Toyota Prius 2021 é a mais recente versão do pioneiro carro híbrido, combinando um motor a combustão eficiente com um motor elétrico. Oferece uma condução suave e silenciosa, além de uma economia de combustível impressionante. O design aerodinâmico e moderno é complementado por uma cabine espaçosa e equipada com tecnologia de ponta.',
    cores: [Colors.blue, Colors.black, Colors.white],
    itensAdicionais: [
      'Detecção de ponto cego (BSD)',
      'Sistema de freio motorizado inteligente',
      'Monitoramento da fadiga do motorista (DFM)',
      'Reconhecimento de sinais de trânsito (TSR)',
      'Trava manual de segurança para crianças',
      'Ar-condicionado dual zone',
      'Conexão Bluetooth para smartphones',
      'Faróis LED automáticos',
    ],
  ),
  Carros(
    nome: 'Civic Hybrid',
    modelo: '2022',
    preco: 'R\$70.000,00',
    avaliacao: 4.3,
    image: 'assets/CivicHybrid.png',
    descricao: 'O Honda Civic Hybrid 2022 oferece desempenho, eficiência e estilo. Combinando um design esportivo com um motor híbrido avançado, ele proporciona economia de combustível excepcional e conforto premium. Ideal para quem busca sustentabilidade sem abrir mão de potência.',
    cores: [Colors.grey, Colors.black],
    itensAdicionais: [
      'Controle adaptativo de velocidade',
      'Sistema de frenagem automática',
      'Câmera traseira com guias dinâmicas',
      'Assistência de permanência em faixa',
      'Banco do motorista ajustável eletricamente',
      'Carregador sem fio para dispositivos móveis',
      'Sistema de som premium',
      'Sensores de estacionamento dianteiros e traseiros',
    ],
  ),
  Carros(
    nome: 'Corolla Hybrid',
    modelo: '2023',
    preco: 'R\$65.000,00',
    avaliacao: 4.6,
    image: 'assets/Corolla.png',
    descricao: 'O Corolla Hybrid 2023 combina tradição e inovação em um sedã híbrido sofisticado. Com tecnologia de ponta, segurança avançada e desempenho eficiente, é perfeito para quem valoriza qualidade e sustentabilidade.',
    cores: [Colors.black, Colors.white],
    itensAdicionais: [
      'Sistema de pré-colisão',
      'Controle eletrônico de estabilidade',
      'Monitoramento de pressão dos pneus',
      'Faróis automáticos de LED',
      'Ar-condicionado automático dual zone',
      'Conexão USB em todas as fileiras',
      'Espelhos retrovisores rebatíveis eletricamente',
      'Central multimídia com tela sensível ao toque',
    ],
  ),
  Carros(
    nome: 'Insight',
    modelo: '2020',
    preco: 'R\$45.000,00',
    avaliacao: 4.2,
    image: 'assets/Insight.png',
    descricao: 'O Honda Insight 2020 é um sedã híbrido que une eficiência energética, conforto e tecnologia. Equipado com recursos avançados de assistência ao motorista, ele garante uma experiência de condução segura e agradável.',
    cores: [Colors.red, Colors.black, Colors.blue],
    itensAdicionais: [
      'Assistência de partida em subida',
      'Controle de tração e estabilidade',
      'Alerta de ponto cego',
      'Faróis de neblina',
      'Sistema de áudio premium com 6 alto-falantes',
      'Espelho retrovisor interno antiofuscante',
      'Sensores de chuva para os limpadores',
      'Bancos dianteiros aquecidos',
    ],
  ),
  Carros(
    nome: 'Auris Hybrid',
    modelo: '2018',
    preco: 'R\$55.000,00',
    avaliacao: 4.9,
    image: 'assets/Auris.png',
    descricao: 'O Auris Hybrid 2018 é um hatchback compacto que oferece uma combinação perfeita de eficiência, desempenho e estilo. Ideal para ambientes urbanos e viagens curtas, ele é uma escolha confiável para quem busca economia sem comprometer o conforto.',
    cores: [Colors.red, Colors.black, Colors.grey],
    itensAdicionais: [
      'Assistência de partida em subida',
      'Controle de tração e estabilidade',
      'Alerta de ponto cego',
      'Faróis de neblina',
      'Volante ajustável em altura e profundidade',
      'Computador de bordo multifuncional',
      'Sistema de navegação GPS integrado',
      'Conexão Wi-Fi integrada',
    ],
  ),
   Carros(
    nome: 'Tesla Model 3',
    modelo: '2023',
    preco: 'R\$200.000,00',
    avaliacao: 4.8,
    image: 'assets/tesla3.png',
    descricao: 'O Tesla Model 3 2023 é um sedã elétrico de alta performance que oferece tecnologia de ponta, direção autônoma e uma experiência de direção inigualável. Com excelente alcance e aceleração, é uma referência no segmento.',
    cores: [Colors.white, Colors.black, Colors.red],
    itensAdicionais: [
      'Piloto automático avançado',
      'Atualizações de software remotas',
      'Sistema de som premium',
      'Câmera de visão 360°',
      'Vidros com isolamento acústico',
      'Carregador rápido integrado',
      'Sistema de freios regenerativos',
      'Tela sensível ao toque de 15 polegadas',
    ],
  ),
  Carros(
    nome: 'Chevrolet Bolt EV',
    modelo: '2023',
    preco: 'R\$190.000,00',
    avaliacao: 4.6,
    image: 'assets/Bolt.png',
    descricao: 'O Chevrolet Bolt EV 2023 é um hatch elétrico compacto que oferece uma condução ágil, excelente alcance e tecnologia avançada. Ideal para deslocamentos urbanos e viagens curtas.',
    cores: [Colors.blue, Colors.grey, Colors.black],
    itensAdicionais: [
      'Sistema de carregamento rápido CCS',
      'Monitoramento de ponto cego',
      'Ar-condicionado automático',
      'Conexão Apple CarPlay e Android Auto',
      'Assistência de frenagem de emergência',
      'Tela central de 10,2 polegadas',
      'Bancos ajustáveis eletricamente',
      'Faróis automáticos em LED',
    ],
  ),
  Carros(
    nome: 'Hyundai Ioniq Electric',
    modelo: '2022',
    preco: 'R\$150.000,00',
    avaliacao: 4.4,
    image: 'assets/Ioniq.png',
    descricao: 'O Hyundai Ioniq Electric 2022 é um sedã compacto e eficiente que combina um design moderno com um motor totalmente elétrico, oferecendo uma experiência de direção sustentável e confortável.',
    cores: [Colors.grey, Colors.blue, Colors.white],
    itensAdicionais: [
      'Sistema de som Infinity',
      'Carregador rápido integrado',
      'Reconhecimento de pedestres',
      'Sistema de assistência em faixa',
      'Ar-condicionado dual zone',
      'Display digital de 7 polegadas',
      'Conexão sem fio para smartphones',
      'Retrovisores com aquecimento',
    ],
  ),
  Carros(
    nome: 'Nissan Leaf',
    modelo: '2023',
    preco: 'R\$180.000,00',
    avaliacao: 4.5,
    image: 'assets/Leaf.png',
    descricao: 'O Nissan Leaf 2023 é um dos pioneiros no segmento de carros elétricos, oferecendo confiabilidade, tecnologia de ponta e uma experiência de direção limpa e silenciosa.',
    cores: [Colors.white, Colors.black, Colors.green],
    itensAdicionais: [
      'Sistema e-Pedal',
      'ProPILOT Assist',
      'Câmera 360°',
      'Bancos dianteiros aquecidos',
      'Sistema de navegação inteligente',
      'Monitoramento de pressão dos pneus',
      'Carregamento rápido CHAdeMO',
      'Painel de instrumentos digital',
    ],
  ),
  Carros(
    nome: 'BMW i3',
    modelo: '2022',
    preco: 'R\$220.000,00',
    avaliacao: 4.7,
    image: 'assets/i3.png',
    descricao: 'O BMW i3 2022 combina luxo e sustentabilidade em um veículo compacto elétrico, oferecendo materiais ecológicos e um desempenho impressionante para a cidade.',
    cores: [Colors.black, Colors.white, Colors.orange],
    itensAdicionais: [
      'Sistema de regeneração de energia',
      'Interior com materiais recicláveis',
      'Assistência de estacionamento',
      'Sistema de som Harman Kardon',
      'Controle climático automático',
      'Portas traseiras no estilo "suicida"',
      'Faróis de LED adaptativos',
      'Painel de instrumentos em LCD',
    ],
  ),
];


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
