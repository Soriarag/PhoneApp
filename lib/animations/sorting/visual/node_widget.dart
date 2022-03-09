import 'package:algo_app/animations/sorting/visual/node_data.dart';
import 'package:flutter/material.dart';

//manages visual represntation of node

class SortNodeWidget extends StatelessWidget {
  final NodeData data;
  final double widgetSize;
  final double containerWidth;

  const SortNodeWidget({
    required Key key,
    required this.data,
    required this.widgetSize,
    required this.containerWidth,
  })  : assert(widgetSize > 30),
        super(key: key);

  Offset _getPosition(double width) {
    final horizontalFit = width ~/ widgetSize;
    final leftOver = width - (horizontalFit * widgetSize);
    final verticalIndex = data.index ~/ horizontalFit;
    final horizontalIndex = data.index % horizontalFit;
    return Offset((widgetSize * horizontalIndex) + leftOver / 2,
        widgetSize * verticalIndex);
  }

  @override
  Widget build(BuildContext context) {
    final offset = _getPosition(containerWidth);

    var _fontSize = 20.0;
    var _borderRadius = 5.0;
    var _borderWidth = 1.0;
    var _borderColor = Colors.black54;
    if (data.state == SortNodeState.untreated) {
      _fontSize = 32;
      _borderRadius = 40.0;
      _borderWidth = 2.0;
    } else if (data.state == SortNodeState.sorted) {
      _fontSize = 20;
      _borderRadius = 5.0;
      _borderWidth = 1.0;
      _borderColor = Colors.green;
    }

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 2250),
      curve: Curves.elasticOut,
      left: offset.dx,
      top: offset.dy,
      child: SizedBox(
        width: widgetSize,
        height: widgetSize,
        child: Padding(
          // border around the value
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            decoration: BoxDecoration(
              border: Border.all(
                color: _borderColor,
                width: _borderWidth,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(_borderRadius),
              ),
            ),
            child: Center(
              //Node value
              child: AnimatedDefaultTextStyle(
                // the
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
                style: TextStyle(
                  color: data.color,
                  fontSize: _fontSize,
                ),
                child: Text(
                  data.value.toString(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
