import 'dart:async';

import 'package:algo_app/animations/sorting/sorting_anim.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class SelectionSortAnim extends SortingAnim {
  void sort() {
    //selection sort alg
    for (var i_to_sort = 0; i_to_sort < list_to_sort.length; i_to_sort++) {
      int min_val = list_to_sort[i_to_sort];
      int min_index = i_to_sort;
      for (var i = 0; i < list_to_sort.length; i++) {}
    }
  }
}
