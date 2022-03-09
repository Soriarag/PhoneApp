import 'dart:async';

import 'package:algo_app/animations/sorting/controller/sorting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class SelectionSortControl extends SortController {
  SelectionSortControl({required List raw_list_to_sort})
      : super(raw_list_to_sort: raw_list_to_sort);

  setMin(int index) => setPivot(index);

  @override
  run() {
    running = true;
    _sort();
  }

  @override
  Future _sort() async {
    //selection sort alg
    for (var iToSort = 0; iToSort < list_to_sort.length; iToSort++) {
      int minVal = readNodeSilent(iToSort);
      int minIndex = iToSort;

      for (var i = iToSort; i < list_to_sort.length; i++) {
        var val = await readNode(i);
        if (val < minVal) {
          await reset(minIndex);
          await setMin(i);

          minIndex = i;
          minVal = val;
        }
      }
      await swap(minIndex, iToSort);
      await setSorted(iToSort);
    }
    running = false;
  }
}
