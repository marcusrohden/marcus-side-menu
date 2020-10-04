import 'package:flutter/material.dart';

class InternalSideCardWidget extends StatelessWidget {
  final bool isMaximised;
  final Widget child;

  InternalSideCardWidget({this.child, this.isMaximised});

  @override
  Widget build(BuildContext context) {
    double _sizeMultiplier;
    isMaximised ? _sizeMultiplier = 0.55 : _sizeMultiplier = 0.15;

    return Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 5),
        child: getDefaultContainer(context, _sizeMultiplier));
  }

  Widget getDefaultContainer(BuildContext context, double sizeMultiplier) {
    return new Container(
        height: MediaQuery.of(context).size.width * sizeMultiplier,
        width: MediaQuery.of(context).size.width * sizeMultiplier,
        child: Container(
            color: isMaximised ? Colors.green : Colors.red, child: child));
  }
}
