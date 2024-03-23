import 'package:flutter/material.dart';

/// Parallax flow delegate for horizontal scroll direction
/// adjusts the horizontal alignment of the background image relative to the scroll position to create the illusion of depth as the user scrolls through the list.
class ParallaxFlowDelegateHorizontal extends FlowDelegate {
  ParallaxFlowDelegateHorizontal({
    required this.scrollable,
    required this.listItemContext,
    required this.imageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey imageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      height: constraints.maxHeight,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);

    final horizontalAlignment = Alignment(scrollFraction * 2 - 1, 0.0);

    final bgSize =
        (imageKey.currentContext!.findRenderObject() as RenderBox).size;
    final listItemSize = context.size;
    final childRect =
        horizontalAlignment.inscribe(bgSize, Offset.zero & listItemSize);

    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(childRect.left, 0.0)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegateHorizontal oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        imageKey != oldDelegate.imageKey;
  }
}
