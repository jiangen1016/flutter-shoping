import 'package:first_flutter/model/index.dart';
import 'package:flutter/material.dart';

//  每日逛

class AdviceItem extends StatefulWidget {
  final List<Advice> adviceList;
  final int index;
  AdviceItem({Key key, this.adviceList, this.index}) : super(key: key);

  _AdviceItemState createState() => _AdviceItemState();
}

class _AdviceItemState extends State<AdviceItem> {
  @override
  Widget build(BuildContext context) {
    var item = widget.adviceList[widget.index];
    return Container(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              item.name,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              item.subName,
              style: TextStyle(fontSize: 12.0),
            ),
            Container(
              child: Image.network(item.url),
            )
          ],
        ));
  }
}
