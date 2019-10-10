import 'package:flutter/material.dart';

void main() => runApp(MyCart());

class MyCart extends StatefulWidget {
  final String msg;
  final bool isFromBar;
  MyCart({Key key, this.msg, this.isFromBar}) : super(key: key);

  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    var isFromBar = widget.isFromBar != null ? true : false;
    if (isFromBar) {
      return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: <Widget>[carList(), pay()],
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('我的购物车'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: <Widget>[carList(), pay()],
          ),
        ),
      );
    }
  }
}

Widget carList() {
  return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return GoodsItem(index: index);
      });
}

Widget pay() {
  return Positioned(
    bottom: 0,
    right: 0,
    child: Row(
      children: <Widget>[
        Container(
          width: 130.0,
          child: RaisedButton(
            onPressed: () {},
            color: Colors.redAccent,
            child: Text(
              '结算',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}

class GoodsItem extends StatefulWidget {
  final int index;
  var goodsList = [false, true, true, false];
  GoodsItem({Key key, this.index}) : super(key: key);

  _GoodsItemState createState() => _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> {
  void _value2Changed(bool value) =>
      setState(() => widget.goodsList[widget.index] = value);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onLongPress: () {},
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Checkbox(
                  //   value: widget.goodsList[widget.index],
                  //   onChanged: _value2Changed,
                  // ),
                  GestureDetector(
                    onTap: () {
                      _value2Changed(!widget.goodsList[widget.index]);
                    },
                    child: widget.goodsList[widget.index]
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.check_circle,
                            color: Colors.grey,
                          ),
                  ),

                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.network(
                              'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp',
                              fit: BoxFit.fill),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text('Apple 苹果x iPhonex 全面屏 手机',
                                    maxLines: 2, softWrap: true),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('¥7888',
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold)),
                                    GoodsNum()
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}

class GoodsNum extends StatefulWidget {
  GoodsNum({Key key}) : super(key: key);

  _GoodsNumState createState() => _GoodsNumState();
}

class _GoodsNumState extends State<GoodsNum> {
  var getValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              width: 30.0,
              child: FlatButton(
                onPressed: () {},
                child: Text('-'),
              )),
          Container(
            width: 50.0,
            child: TextField(
              decoration:
                  InputDecoration(hintText: "", border: InputBorder.none),
              textAlign: TextAlign.center,
              onChanged: (value) => getValue = value,
            ),
          ),
          Container(
            width: 30.0,
            child: FlatButton(
              onPressed: () {},
              child: Text('+'),
            ),
          )
        ],
      ),
    );
  }
}
