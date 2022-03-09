import 'node_data.dart';
import 'node_widget.dart';
import 'package:algo_app/animations/sorting/controller/sorting_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortVisualizer<T extends SortController> extends StatelessWidget {
  const SortVisualizer({
    Key? key,
    this.blockSize = 100,
    required this.width,
  }) : super(key: key);

  final double blockSize;
  final double width;

  double _getHeight(double width, int numOfWidgets) {
    final horizontalFit = width ~/ blockSize;
    final rows = (numOfWidgets / horizontalFit).ceil();
    return rows * blockSize;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<T>(
        builder: (_, controller, __) {
          return SizedBox(
            width: width,
            height: _getHeight(
              width,
              controller.list_to_sort.length,
            ),
            child: Stack(
              children: <Widget>[
                for (var i = 0; i < controller.list_to_sort.length; i++)
                  SortNodeWidget(
                    key: controller.list_to_sort[i].key,
                    data: controller.list_to_sort[i],
                    widgetSize: blockSize,
                    containerWidth: width,
                  )
              ],
            ),
          );
        },
      ),
    );
    // child:
  }
}
