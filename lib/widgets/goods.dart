import 'package:first_flutter/model/index.dart';
import 'package:flutter/material.dart';

// 商品列表

class GoodsItem extends StatefulWidget {
  final List<Goods> goodList;
  final int index;

  GoodsItem({Key key, this.goodList, this.index}) : super(key: key);

  _GoodsItemState createState() => _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> {
  @override
  Widget build(BuildContext context) {
    var item = widget.goodList[widget.index];
    return Container(
      padding: widget.index % 2 == 0
          ? EdgeInsets.fromLTRB(0, 0, 20.0, 0)
          : EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          Container(
            height: 200.0,
            padding: EdgeInsets.all(10.0),
            child: Image.network(item.url),
          ),
          Expanded(
              // padding: const EdgeInsets.all(10.0),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                style: TextStyle(fontSize: 12.0),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                  height: 30.0,
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '¥${item.price}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                            height: 20.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                    width: 1.0,
                                    color: Colors.redAccent,
                                    style: BorderStyle.solid)),
                            child: Center(
                              child: Text(
                                '购买',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ))
                    ],
                  ))
            ],
          ))
        ],
      ),
    );
  }
}
