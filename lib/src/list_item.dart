import 'package:flutter/material.dart';
import 'package:parallax_cards/src/parallax_flow_delegate_horizontal.dart';
import 'package:parallax_cards/src/parallax_flow_delegate_vertical.dart';

/// Individual card item
class ListItem extends StatelessWidget {
  /// imageKey for the background image - Important
  final GlobalKey imageKey = GlobalKey();
  final int index;
  final Axis scrollDirection;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Function(int index)? onTap;
  final Widget overlay;
  final String img;

  ListItem({
    required this.img,
    required this.overlay,
    required this.index,
    this.scrollDirection = Axis.vertical,
    this.width,
    this.height,
    this.margin,
    this.borderRadius,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(16),
      width: width ?? (scrollDirection == Axis.vertical ? 400 : 200),
      height: height ?? (scrollDirection == Axis.vertical ? 200 : 400),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!.call(index);
            }
          },
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              overlay,
            ],
          ),
        ),
      ),
    );
  }

  /// uses [Flow] widget to build the parallax background - requires a [FlowDelegate]
  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
        delegate: scrollDirection == Axis.vertical
            ? ParallaxFlowDelegateVertical(
                scrollable: Scrollable.of(context),
                listItemContext: context,
                imageKey: imageKey,
              )
            : ParallaxFlowDelegateHorizontal(
                scrollable: Scrollable.of(context),
                listItemContext: context,
                imageKey: imageKey,
              ),
        children: [
          (img.startsWith('http'))
              ? Image.network(
                  img,
                  key: imageKey,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  img,
                  key: imageKey,
                  fit: BoxFit.cover,
                ),
        ]);
  }
}
