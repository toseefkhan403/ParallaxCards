import 'dart:developer';

import 'package:example/vertical_example.dart';
import 'package:flutter/material.dart';
import 'package:parallax_cards/parallax_cards.dart';

import 'constants.dart';

class HorizontalExample extends StatefulWidget {
  const HorizontalExample({super.key});

  @override
  State<HorizontalExample> createState() => _HorizontalExampleState();
}

class _HorizontalExampleState extends State<HorizontalExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ParallaxCards(
                scrollDirection: Axis.horizontal,
                imagesList: imagesList,
                width: 250,
                height: 350,
                onTap: (index) {
                  log('$index pressed');
                },
              ),
              ParallaxCards(
                scrollDirection: Axis.horizontal,
                imagesList: imagesList,
                width: 250,
                height: 350,
                onTap: (index) {
                  log('$index pressed');
                },
                overlays: [
                  for (var title in titlesList)
                    // this will be a stack element on top of the image - customize however you want
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      constraints: const BoxConstraints.expand(),
                      child: Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const VerticalExample()));
                    },
                    child: const Text('See Vertical Example')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
