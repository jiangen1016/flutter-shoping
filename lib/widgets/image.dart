import 'package:flutter/material.dart';

class SetImage {
  Widget mgNetwork(url) {
    return Image.network(
      url,
      fit: BoxFit.fill,
    );
  }
}
