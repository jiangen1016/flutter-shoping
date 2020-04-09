import 'package:first_flutter/detail.dart';
import 'package:first_flutter/model/index.dart';
import 'package:first_flutter/provider/carModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'http/http.dart';

class MyCart extends StatefulWidget {
  final String msg;
  final bool isFromBar;
  MyCart({Key key, this.msg, this.isFromBar}) : super(key: key);

  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> with AutomaticKeepAliveClientMixin {
  List<CarItem> carData = [];
  @override
  bool get wantKeepAlive => true;

  initState() {
    super.initState();
    print('car page init');
    // print(Provider.of<CarData>(context).carList);
    // widget 绘制完毕后
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('test');
      var isEmpty = Provider.of<CarData>(context, listen: false).isEmpty();
      print(isEmpty);
      if (isEmpty) {
        this.getMycarList();
      } else {
        List<CarItem> carList =
            Provider.of<CarData>(context, listen: false).carList;
        setState(() {
          carData = carList;
        });
      }
    });
    // this.carData = [
    //   // CarItem('Apple 苹果x iPhonex 全面屏 手机', 4888, 1,
    //   //     'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp'),
    //   // CarItem('Apple 苹果x iPhonex 全面屏 手机', 5888, 1,
    //   //     'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp'),
    //   // CarItem('Apple 苹果x iPhonex 全面屏 手机', 6888, 1,
    //   //     'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp'),
    //   // CarItem('Apple 苹果x iPhonex 全面屏 手机', 7888, 1,
    //   //     'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp'),
    //   // CarItem('Apple 苹果x iPhonex 全面屏 手机', 8888, 1,
    //   //     'http://img10.360buyimg.com/mobilecms/s234x234_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q70.dpg.webp')
    // ];
  }

  getMycarList() {
    _getList().then((res) {
      var data = List<CarItem>.from(res.map((item) => CarItem(
          item['goodsName'],
          item['goodsPrice'],
          item['goodCount'],
          item['goodsImg'],
          item['isChoosed'])));
      Provider.of<CarData>(context, listen: false).setCarlist(data);
      setState(() {
        carData = data;
      });
    });
  }

  @override
  void deactivate() {
    print('移除时：deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    // HttpUtils.request(
    //         'https://www.fastmock.site/mock/b7b1c8dd0f5250ffc71c0d191e06758b/dio/get')
    //     .then((res) {
    //   print(res);
    //   this.carData = List<CarItem>.from(res.map((item) => CarItem(
    //       item['goodsName'],
    //       item['goodsPrice'],
    //       item['goodCount'],
    //       item['goodsImg'],
    //       item['isChoosed'])));
    // });
    // _doRefresh().then((result) {
    //   print(result);
    // });

    var isFromBar = widget.isFromBar != null ? true : false;
    if (isFromBar) {
      return ReturnCarMain(
        callBack: getMycarList,
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('我的购物车'),
          ),
          body: ReturnCarMain(
            callBack: getMycarList,
          ));
    }
  }
}

Future _getList() async {
  return await HttpUtils.request(
      'https://www.fastmock.site/mock/b7b1c8dd0f5250ffc71c0d191e06758b/dio/get');
}

class ReturnCarMain extends StatefulWidget {
  final Function callBack;
  ReturnCarMain({Key key, @required this.callBack}) : super(key: key);

  @override
  _ReturnCarMainState createState() => _ReturnCarMainState();
}

class _ReturnCarMainState extends State<ReturnCarMain> {
  @override
  Widget build(BuildContext context) {
    var carData = Provider.of<CarData>(context);
    return RefreshIndicator(
        child: Container(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Stack(
                children: <Widget>[
                  // CircularProgressIndicator(), // loading
                  Container(
                    margin: const EdgeInsets.only(bottom: 50.0),
                    child: ListView.builder(
                        // itemCount: 0,
                        itemCount: carData.carList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GoodsItem(
                            index: index,
                          );
                        }),
                  ),
                  Pay()
                ],
              )),
        ),
        onRefresh: _onRefresh);
  }

  Future<void> _onRefresh() async {
    await widget.callBack();
  }
}

// 没必要用 StatefullWidget
// class _ReturnCarMainState extends State<ReturnCarMain> {
//   @override
//   Widget build(BuildContext context) {
//     var carData = Provider.of<CarData>(context);

//     return Container(
//       child: Padding(
//           padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 margin: const EdgeInsets.only(bottom: 50.0),
//                 child: ListView.builder(
//                     itemCount: carData.carList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return GoodsItem(
//                         index: index,
//                       );
//                     }),
//               ),
//               Pay()
//             ],
//           )),
//     );
//   }
// }

// 商品列表

class GoodsItem extends StatefulWidget {
  final int index;
  GoodsItem({Key key, this.index}) : super(key: key);

  _GoodsItemState createState() => _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> {
  @override
  Widget build(BuildContext context) {
    var carData = Provider.of<CarData>(context);
    var item = carData.carList[widget.index];

    return Container(
        child: GestureDetector(
            onLongPress: () {
              showDialog<Null>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('删除'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('确定删除这个商品吗？'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('确定'),
                        onPressed: () {
                          carData.delItem(widget.index);
                          Navigator.of(context).pop();
                          //  Scaffold.of(context).showSnackBar(SnackBar(
                          //   content: Text('删除成功'),
                          // ));
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
                        carData.valueChanged(widget.index);
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GoodsDetail()));
                            },
                            child:
                                Image.network(item.goodsImg, fit: BoxFit.fill),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GoodsDetail()));
                                    },
                                    child: Text(
                                      item.goodsName,
                                    )),
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
                                      index: widget.index,
                                    )
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

// 商品数量

class GoodsNum extends StatefulWidget {
  final int index;

  GoodsNum({Key key, this.index}) : super(key: key);

  _GoodsNumState createState() => _GoodsNumState();
}

class _GoodsNumState extends State<GoodsNum> {
  var getValue;
  TextEditingController numberController = TextEditingController();

  void initState() {
    //  保持光标在input、最后面
    numberController.selection = TextSelection.fromPosition(TextPosition(
        offset: numberController.text.length,
        affinity: TextAffinity.downstream));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var carData = Provider.of<CarData>(context);
    var countText = carData.carList[widget.index].goodCount.toString();
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              width: 30.0,
              child: FlatButton(
                onPressed: () {
                  carData.changeGoodsCount(widget.index, '-', 0);
                },
                child: Text(
                  '-',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              )),
          Container(
            width: 100.0,
            child: TextField(
              readOnly: true,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext contex) {
                      return AlertDialog(
                        title: Text('修改商品数量'),
                        content: TextField(
                          autofocus: true,
                          controller: TextEditingController.fromValue(
                              TextEditingValue(
                                  // 设置内容
                                  text: countText.toString(),
                                  // 保持光标在最后
                                  selection: TextSelection.fromPosition(
                                      TextPosition(
                                          affinity: TextAffinity.downstream,
                                          offset: countText.length)))),
                          onChanged: (e) {
                            print(int.parse(e));
                            if (int.parse(e) > 999) {
                              numberController.text = '999';
                              setState(() {
                                countText = '999';
                              });
                            } else {
                              numberController.text = e;
                            }
                          },
                        ),
                        actions: <Widget>[
                          FlatButton(
                              child: Text("取消"),
                              onPressed: () {
                                Navigator.pop(context);
                                print("取消");
                              }),
                          FlatButton(
                              child: Text("确定"),
                              onPressed: () {
                                if (numberController.text !=
                                        carData.carList[widget.index].goodCount
                                            .toString() &&
                                    numberController.text != '') {
                                  Provider.of<CarData>(context, listen: false)
                                      .changeCountForModal(widget.index,
                                          int.parse(numberController.text));
                                }
                                Navigator.pop(context);
                              })
                        ],
                      );
                    });
              },
              controller: TextEditingController.fromValue(TextEditingValue(
                      text:
                          '${carData.carList[widget.index].goodCount}') //判断keyword是否为空)
                  ),
              decoration:
                  InputDecoration(hintText: "", border: InputBorder.none),
              textAlign: TextAlign.center,
              onChanged: (value) =>
                  carData.changeGoodsCount(widget.index, '', int.parse(value)),
            ),
          ),
          Container(
            width: 30.0,
            child: FlatButton(
              onPressed: () {
                carData.changeGoodsCount(widget.index, '+', 0);
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

//  底部结算
class Pay extends StatefulWidget {
  Pay({Key key}) : super(key: key);

  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  initState() {
    super.initState();
  }

  String getFixedTwo(double num) {
    String getFixed = num.toString();
    if (getFixed.indexOf('.') == -1) {
      getFixed += '.00';
    } else if (getFixed.length < getFixed.indexOf('.') + 3) {
      getFixed += '0';
    }
    var index = getFixed.indexOf('.');
    return getFixed.substring(0, index + 3);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var carData = Provider.of<CarData>(context);

    var totalPrice = carData.totalPrice != null ? carData.totalPrice : 0;
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
                    carData.isChooseAll == true
                        ? IconButton(
                            onPressed: () {
                              carData.chooseAll();
                            },
                            color: Colors.redAccent,
                            icon: Icon(Icons.check_circle),
                          )
                        : IconButton(
                            onPressed: () {
                              carData.chooseAll();
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
                                    // totalPrice.toStringAsFixed(2),  因为toStringAsFixed会四舍五入，所以洗一个街区字符串的方法
                                    text: getFixedTwo(totalPrice),
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
              width: screenWidth / 4,
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
      ),
    );
  }
}
