
import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  final double? height;
  const CircularIndicator({Key? key,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: Transform.scale(alignment: Alignment.center,scale: height ,child: const CircularProgressIndicator(strokeWidth: 2.0,color: Colors.red,)),);
  }
}