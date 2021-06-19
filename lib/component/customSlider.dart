import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  final int? min;
  final int? max;
  const MyStatefulWidget({Key? key, this.min, this.max}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}