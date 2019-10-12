import 'package:first_flutter/model/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyCart());

class MyCart extends StatefulWidget {
  final String msg;
  final bool isFromBar;
  MyCart({Key key, this.msg, this.isFromBar}) : super(key: key);

  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> with AutomaticKeepAliveClientMixin {
  List<CarItem> carGoodsList;
  @override
  bool get wantKeepAlive => true;

  void initState() {
    super.initState();
    print('car page init');
    this.carGoodsList = [
      CarItem('Apple 苹果x iPhonex 全面屏 手机', 4888, 1,
          'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp'),
      CarItem('Apple 苹果x iPhonex 全面屏 手机', 5888, 1,
          'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp'),
      CarItem('Apple 苹果x iPhonex 全面屏 手机', 6888, 1,
          'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp'),
      CarItem('Apple 苹果x iPhonex 全面屏 手机', 7888, 1,
          'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp'),
      CarItem('Apple 苹果x iPhonex 全面屏 手机', 8888, 1,
          'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp')
    ];
    this.carGoodsList.forEach((item) => item.isChoosed = false);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var carGoodsList = this.carGoodsList;
    var isFromBar = widget.isFromBar != null ? true : false;

    // 获取是不是全选了
    bool _getIsChooseAll() {
      return carGoodsList.every((item) => item.isChoosed == true);
    }

    //  获取合计总金额
    double _getTotalPrice() {
      double price = 0;
      for (int i = 0; i < carGoodsList.length; i++) {
        if (carGoodsList[i].isChoosed) {
          price += carGoodsList[i].goodCount * carGoodsList[i].goodsPrice;
        }
      }
      return price;
    }

    var isChooseAll = _getIsChooseAll();
    var totalPrice = _getTotalPrice();

    // 单个选择，检查是不是全选，计算金额
    _doCheck() {
      setState(() {
        isChooseAll = isChooseAll;
        totalPrice = _getTotalPrice();
      });
    }

    // 一键全选和取消全选
    _chooseAll(val) {
      setState(() {
        carGoodsList.forEach((item) => item.isChoosed = val);
        totalPrice = _getTotalPrice();
      });
    }

    Widget returnCarMain() {
      return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 50.0),
                child: ListView.builder(
                    itemCount: carGoodsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GoodsItem(
                        index: index,
                        carList: carGoodsList,
                        checkChoose: _doCheck,
                      );
                    }),
              ),
              Pay(
                  screenWidth: screenWidth,
                  carGoodsList: carGoodsList,
                  isChooseAll: isChooseAll,
                  totalPrice: totalPrice,
                  callBack: (a) => _chooseAll(a))
            ],
          ));
    }

    if (isFromBar) {
      return returnCarMain();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('我的购物车'),
        ),
        body: returnCarMain(),
      );
    }
  }
}

class Pay extends StatefulWidget {
  final screenWidth;
  final List<CarItem> carGoodsList;
  bool isChooseAll;
  double totalPrice;
  Function callBack;
  Pay(
      {Key key,
      @required this.screenWidth,
      this.carGoodsList,
      this.callBack,
      this.isChooseAll,
      this.totalPrice})
      : super(key: key);

  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  // bool isChooseAll;
  initState() {
    super.initState();
    // this.isChooseAll =
    //     widget.carGoodsList.every((test) => test.isChoosed == true);
  }

  @override
  Widget build(BuildContext context) {
    var totalPrice = widget.totalPrice != null ? widget.totalPrice : 0;
    return Container(
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 3.0),
                child: Row(
                  children: <Widget>[
                    widget.isChooseAll == true
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                widget.isChooseAll = false;
                              });
                              widget.callBack(false);
                            },
                            color: Colors.redAccent,
                            icon: Icon(Icons.check_circle),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                widget.isChooseAll = true;
                              });
                              widget.callBack(true);
                            },
                            color: Colors.grey,
                            icon: Icon(Icons.check_circle),
                          ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              text: '合计:',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                    text: '￥',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.red)),
                                TextSpan(
                                    text: totalPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red))
                              ]),
                        ))
                  ],
                ),
              ),
            ),
            Container(
              width: widget.screenWidth / 4,
              child: RaisedButton(
                onPressed: () {
                  print(widget.carGoodsList);
                },
                color: Colors.redAccent,
                child: Text(
                  '结算',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GoodsItem extends StatefulWidget {
  final List<CarItem> carList;
  final int index;
  Function checkChoose;
  GoodsItem({Key key, this.index, this.carList, this.checkChoose})
      : super(key: key);

  _GoodsItemState createState() => _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> {
  void _valueChanged(CarItem item, bool value) {
    setState(() {
      item.isChoosed = value;
      print(widget.carList);
      widget.checkChoose();
    });
  }

  @override
  Widget build(BuildContext context) {
    var item = widget.carList[widget.index];

    return Container(
        child: GestureDetector(
            onLongPress: () {
              showDialog<Null>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: Text('删除'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('确定删除��个商品吗？'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('确定'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('取消'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                },
              );
              // Scaffold.of(context).showSnackBar(SnackBar(
              //   content: Text('删除这个'),
              // ));
            },
            child: Card(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 20.0,
                    child: GestureDetector(
                      onTap: () {
                        _valueChanged(item, !item.isChoosed);
                      },
                      child: item.isChoosed
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.check_circle,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.network(item.goodsImg, fit: BoxFit.fill),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(item.goodsName,
                                    maxLines: 2, softWrap: true),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('¥${item.goodsPrice}',
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold)),
                                    GoodsNum(
                                        carList: widget.carList,
                                        defaultCount: item.goodCount.toString(),
                                        index: widget.index,
                                        getAmount: widget.checkChoose)
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
  final int index;
  String defaultCount;
  Function getAmount;
  final List<CarItem> carList;
  GoodsNum(
      {Key key, this.index, this.defaultCount, this.carList, this.getAmount})
      : super(key: key);

  _GoodsNumState createState() => _GoodsNumState();
}

class _GoodsNumState extends State<GoodsNum> {
  var getValue;

  void initState() {
    super.initState();
  }

  _changCount(int type) {
    if (widget.carList[widget.index].goodCount == 1 && type == 0) {
      return;
    } else {
      type == 0
          ? setState(() {
              widget.carList[widget.index].goodCount =
                  widget.carList[widget.index].goodCount - 1;
            })
          : setState(() {
              widget.carList[widget.index].goodCount =
                  widget.carList[widget.index].goodCount + 1;
            });
      widget.getAmount();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              width: 30.0,
              child: FlatButton(
                onPressed: () {
                  _changCount(0);
                },
                child: Text(
                  '-',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              )),
          Container(
            width: 50.0,
            child: TextField(
              controller: TextEditingController.fromValue(TextEditingValue(
                      text:
                          '${widget.carList[widget.index].goodCount}') //判断keyword是否为空)
                  ),
              decoration:
                  InputDecoration(hintText: "", border: InputBorder.none),
              textAlign: TextAlign.center,
              onChanged: (value) => getValue = value,
            ),
          ),
          Container(
            width: 30.0,
            child: FlatButton(
              onPressed: () {
                _changCount(1);
              },
              child: Text(
                '+',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
