import 'package:flutter/material.dart';

//what's theoretically on the node

enum SortNodeState { sorted, pivot, untreated, scanning }

class NodeData {
  final int value;
  final GlobalKey key;
  final int index;
  SortNodeState state = SortNodeState.untreated;
  Color color = Colors.black54;

  NodeData({required this.value, required this.index})
      : assert(index >= 0),
        key = GlobalKey();

  void reset() {
    state = SortNodeState.untreated;
    color = Colors.black54;
  }

  void setSorted() {
    state = SortNodeState.sorted;
    color = Colors.green;
  }

  void setPivot() {
    state = SortNodeState.pivot;
    color = Colors.pink;
  }
}
