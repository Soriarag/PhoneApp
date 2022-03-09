import "package:algo_app/animations/base_controller.dart";
import "package:flutter/material.dart";
import 'package:algo_app/animations/sorting/visual/node_data.dart';

//this guy gives orders to all other guys

class SortController extends BaseController {
  List<NodeData> list_to_sort = [];

  SortController({required List raw_list_to_sort}) {
    for (var i = 0; i < raw_list_to_sort.length; i++) {
      var data = NodeData(index: i, value: raw_list_to_sort[i]);
      list_to_sort.add(data);
    }
  }

  readNodeSilent(int index) {
    return list_to_sort[index].value;
  }

  int readNode(int index) {
    return list_to_sort[index].value;
  }

  void swap(int index1, int index2) {
    var val = list_to_sort[index1];
    list_to_sort[index1] = list_to_sort[index2];
    list_to_sort[index2] = val;
  }

  reset(int index) {
    list_to_sort[index].reset();
  }

  void setPivot(int index) {
    list_to_sort[index].setPivot();
  }

  void setSorted(int index) {
    list_to_sort[index].setSorted();
  }
}
