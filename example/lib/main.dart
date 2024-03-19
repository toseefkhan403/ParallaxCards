import 'package:flutter/material.dart';
import 'package:parallax_cards/parallax_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parallax Cards Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ParallaxCards(
        scrollDirection: Axis.horizontal,
        imagesList: locations,
        width: 280,
        onTap: (index) {
          print('$index pressed');
        },
        overlays: [
          for(var img in locations)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                // child: Text('$img'),
              ),
            )
        ],
      ),
    );
  }
}

const urlPrefix =
    'https://docs.flutter.dev/cookbook/img-files/effects/parallax';
const locations = [
  '$urlPrefix/01-mount-rushmore.jpg',
  '$urlPrefix/02-singapore.jpg',
  'assets/images/car.jpg',
  '$urlPrefix/03-machu-picchu.jpg',
  '$urlPrefix/04-vitznau.jpg',
  '$urlPrefix/05-bali.jpg',
  '$urlPrefix/06-mexico-city.jpg',
  '$urlPrefix/07-cairo.jpg',
];