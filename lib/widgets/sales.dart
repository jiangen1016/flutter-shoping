import 'package:first_flutter/model/index.dart';
import 'package:flutter/material.dart';

//  先试抢购

class SalesItem extends StatefulWidget {
  final List<Sales> sales;
  final int index;
  SalesItem({Key key, this.sales, this.index}) : super(key: key);

  _SalesItemState createState() => _SalesItemState();
}

class _SalesItemState extends State<SalesItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 100.0,
            child: Column(
              children: <Widget>[
                Image.network(widget.sales[widget.index].imgUrl),
                Text(
                  '¥${widget.sales[widget.index].salesPrice}',
                  style: TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),
                Text(
                  '¥${widget.sales[widget.index].price}',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationStyle: TextDecorationStyle.dashed),
                )
              ],
            ),
          )),
    );
  }
}
