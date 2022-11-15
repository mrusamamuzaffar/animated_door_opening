import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedFold extends StatefulWidget {
  const AnimatedFold(
      {
        Key? key,
        required this.frontWidget,
        this.animationDuration = const Duration(milliseconds: 1000),
       }) : super(key: key);

  final Widget? frontWidget;
  final Duration? animationDuration;

  @override
  AnimatedFoldState createState() => AnimatedFoldState();
}

class AnimatedFoldState extends State<AnimatedFold> with SingleTickerProviderStateMixin {
  bool _isOpened = false;
  late AnimationController _animationController;

  void toggleFold() {
    if (_isOpened) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    _isOpened = !_isOpened;
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: widget.animationDuration,);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final angle = _animationController.value * pi;

          return Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(-angle / 2.5),
            child: widget.frontWidget,
          );
        });
  }
}