import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parallax_cards/parallax_cards.dart';

void main() {
  const images = [
    'assets/images/colosseum.jpg',
    'assets/images/florence.png',
  ];

  group('ParallaxCards widget tests', () {
    testWidgets('Renders ParallaxCards widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ParallaxCards(
            imagesList: [images[0], images[1]],
          ),
        ),
      );

      expect(find.byType(ParallaxCards), findsOneWidget);

      expect(find.byType(Image), findsNWidgets(2));
    });
  });
}
