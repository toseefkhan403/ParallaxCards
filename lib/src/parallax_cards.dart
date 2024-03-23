import 'package:flutter/material.dart';

import 'list_item.dart';

/// A scrollview generating the listItems with parallax background
class ParallaxCards extends StatelessWidget {
  /// scroll direction of the entire scrollview
  final Axis scrollDirection;

  /// item width
  final double? width;

  /// item height
  final double? height;

  /// card margin
  final EdgeInsetsGeometry? margin;

  /// card border radius
  final BorderRadiusGeometry? borderRadius;

  /// onTap callback. Gives index of the tapped image in the list
  final Function(int index)? onTap;

  /// overlays list - can add separate overlay to each card
  final List<Widget>? overlays;

  /// background images list - can have url or asset path - required
  final List<String> imagesList;

  const ParallaxCards(
      {required this.imagesList,
      this.scrollDirection = Axis.vertical,
      this.width,
      this.height,
      this.margin,
      this.borderRadius,
      this.overlays,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (overlays != null) {
      assert(overlays?.length == imagesList.length,
          'Number of overlays must be equal to the number of images');
    }

    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      child: Flex(direction: scrollDirection, children: generateChildren()),
    );
  }

  /// generate [ListItem] for each element of the imagesList
  List<Widget> generateChildren() {
    List<Widget> children = [];
    for (int i = 0; i < imagesList.length; i++) {
      children.add(
        ListItem(
          img: imagesList[i],
          overlay: overlays != null ? overlays![i] : const SizedBox.shrink(),
          index: i,
          scrollDirection: scrollDirection,
          width: width,
          height: height,
          margin: margin,
          onTap: onTap,
          borderRadius: borderRadius,
        ),
      );
    }

    return children;
  }
}
