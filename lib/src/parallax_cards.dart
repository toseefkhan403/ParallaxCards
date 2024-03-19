import 'package:flutter/material.dart';

import 'list_item.dart';

class ParallaxCards extends StatelessWidget {
  final Axis scrollDirection;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Function(int index)? onTap;
  final List<Widget>? overlays;
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
