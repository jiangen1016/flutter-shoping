import 'package:flutter/material.dart';
import 'package:first_flutter/model/index.dart';

class Category extends StatefulWidget {
  final CategoryItem categoryItem;
  Category({Key key, this.categoryItem}) : super(key: key);

  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var item = widget.categoryItem;

    return Container(
      width: screenWidth / 5,
      height: screenWidth / 5,
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              item.icon,
              width: 48.0,
            ),
          ),
          Text(item.title)
        ],
      ),
    );
  }
}
