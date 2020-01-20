import 'package:first_flutter/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(GoodsDetail());

class GoodsDetail extends StatefulWidget {
  GoodsDetail({Key key}) : super(key: key);

  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  final goodsImgs = [
    'http://m.360buyimg.com/mobilecms/s750x750_jfs/t1/59022/28/10293/141808/5d78088fEf6e7862d/68836f52ffaaad96.jpg!q80.dpg.webp',
    'http://m.360buyimg.com/mobilecms/s843x843_jfs/t1/45954/33/10562/97168/5d780893Eaec0fe47/ee567a1dea515d38.jpg!q70.dpg.webp',
    'http://m.360buyimg.com/mobilecms/s843x843_jfs/t1/80220/18/9892/163090/5d78089cEda2f9674/da3b18358e68cfca.jpg!q70.dpg.webp',
    'http://m.360buyimg.com/mobilecms/s843x843_jfs/t1/61588/10/9949/164377/5d7808a1E6c3615dd/7c45f7039b9cbae8.jpg!q70.dpg.webp'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('商品详情')),
        body: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                '123',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      height: 350.0,
                      child: Swiper(
                        itemCount: goodsImgs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(goodsImgs[index],
                              fit: BoxFit.fill);
                        },
                        pagination: SwiperPagination(margin: EdgeInsets.all(4)),
                      ),
                    )),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width),
                  child: Image.network(
                      'https://img10.360buyimg.com/ling/jfs/t1/109348/9/4702/72798/5e216daaE59fbf804/5caed3c8780968c3.jpg'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 50),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '¥599.00',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.attach_money,
                                      size: 20.0,
                                    ),
                                    Text(
                                      '降价提醒',
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.grey),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        size: 20.0,
                                      ),
                                      Text(
                                        '收藏',
                                        style: TextStyle(
                                            fontSize: 14.0, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Apple iPhone 11 (A2223) 128GB 黑色 移动联通电信4G手机 双卡双待',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '【年货节抢购攻略】iPhone11Pro系列抢券享12期免息轻松月付无压力，XSMax限时抢券立减500元！更多优惠点击！ ',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                      Image.network(
                          'https://img12.360buyimg.com/cms/jfs/t1/59203/28/10465/47768/5d791cd5Ee180cd0f/daf6ada1d57ca369.jpg!q70.dpg.webp'),
                      Image.network(
                          'https://img10.360buyimg.com/cms/jfs/t1/52388/18/10385/1411768/5d77f9b4E2d7878f2/e7c050794c278d17.jpg!q70.dpg.webp'),
                      Image.network(
                          'https://img12.360buyimg.com/cms/jfs/t1/40404/18/10660/539422/5d7b1c64Ed482a344/c7a223e22eaf0571.jpg!q70.dpg.webp')
                    ],
                  ),
                )
              ],
            ),
            GoodsTool()
          ],
        ));
  }
}

class GoodsTool extends StatelessWidget {
  const GoodsTool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
            color: Colors.white,
            constraints: BoxConstraints.tightFor(
              width: mWidth,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            //  联系客服
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.contact_phone),
                              Text('联系客服')
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //  去店铺
                          },
                          child: Column(
                            children: <Widget>[Icon(Icons.home), Text('进店')],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //  去购物车
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyCart(msg: '姜恩')));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.shopping_cart),
                              Text('购物车')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                alignment: Alignment.center,
                                color: Color(0xFFFFb000),
                                child: Text('购物车',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                alignment: Alignment.center,
                                color: Color(0xFFFF2000),
                                child: Text('立即购买',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )

                          // RaisedButton(
                          //   onPressed: () {
                          //     Scaffold.of(context).showSnackBar(SnackBar(
                          //       content: Text('添加购物车成功'),
                          //     ));
                          //   },
                          //   child: Text('加入购物车'),
                          //   textColor: Colors.white,
                          //   color: const Color(0xFFFFb000),
                          // ),
                          // RaisedButton(
                          //   onPressed: () {},
                          //   child: Text('立即购买'),
                          //   textColor: Colors.white,
                          //   color: const Color(0xFFFF2000),
                          // ),
                        ],
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
