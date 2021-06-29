import 'package:flutter/material.dart';

/// start with the state of 10
class CounterState extends ValueNotifier<int> {
  CounterState() : super(_initialValue);

  Future<void> initialize() async {
    // final savedTime = await _storageService.getTimeLeft() ?? _initialValue;
    // _updateTimeLeft(savedTime);
  }

  // use initial value to notify in super and also to setup state locally
  static const int _initialValue = 10;

  void apply(int newState) => value = newState;

  @override
  void dispose() => super.dispose();

}


