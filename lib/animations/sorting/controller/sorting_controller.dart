import "package:algo_app/animations/base_controller.dart";
import "package:flutter/material.dart";
import 'package:algo_app/animations/sorting/visual/node_data.dart';

//this guy gives orders to all other guys

abstract class SortController extends BaseController {
  List<NodeData> list_to_sort = [];

  SortController({required List raw_list_to_sort}) {
    for (var i = 0; i < raw_list_to_sort.length; i++) {
      var data = NodeData(index: i, value: raw_list_to_sort[i]);
      list_to_sort.add(data);
    }
  }

  run() {
    running = true;
    _sort();
  }

  _sort();

  readNodeSilent(int index) {
    return list_to_sort[index].value;
  }

  Future<int> readNode(int index) async {
    await pause();
    return list_to_sort[index].value;
  }

  Future swap(int index1, int index2) async {
    var val = list_to_sort[index1];
    list_to_sort[index1] = list_to_sort[index2];
    list_to_sort[index2] = val;
    //exchange indexes effectively
    list_to_sort[index1].index = index1;
    list_to_sort[index2].index = index2;

    render();
    await pause();
  }

  Future reset(int index) async {
    list_to_sort[index].reset();
    render();
    await pause();
  }

  Future setPivot(int index) async {
    list_to_sort[index].setPivot();
    render();
    await pause();
  }

  Future setSorted(int index) async {
    list_to_sort[index].setSorted();
    render();
    await pause();
  }
}
