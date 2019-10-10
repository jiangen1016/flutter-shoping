import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;

  GradientText(this.text,
      {@required this.gradient, this.style, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) {
          return gradient.createShader(Offset.zero & bounds.size);
        },
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
        ));
  }
}
