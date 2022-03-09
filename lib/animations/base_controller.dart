import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class BaseController extends ChangeNotifier {
  double _executionSpeed = 0.5;
  double get executionSpeed => _executionSpeed;
  set executionSpeed(double speed) {
    if (speed > 1.0) {
      _executionSpeed = 1;
      return;
    }
    if (speed < 0) {
      _executionSpeed = 0;
      return;
    }
    _executionSpeed = speed;
    render();
  }

  @protected
  void render() {
    notifyListeners();
  }

  Future wait({double speed = 0.5}) {
    var res = lerpDouble(100, 2000, speed);
    if (res != null) {
      final milliseconds = res.toInt();
      return Future.delayed(Duration(milliseconds: milliseconds));
    }
    return Future.delayed(Duration(milliseconds: 2000));
  }

  @protected
  Future pause() async {
    await wait(speed: executionSpeed);
  }
}
