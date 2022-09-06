import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: Colors.white,
        secondRingColor: const Color(0xFF1A1A3F),
        thirdRingColor: const Color(0xff309a6d),
        size: 60,
      ),
    );;
  }
}
