import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int value = 0;

  increment(int state){
    value = state;
    notifyListeners();
  }
}