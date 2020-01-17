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
    'http://m.360buyimg.com/mobilecms/s750x750_jfs/t12352/88/127708421/67468/90baaf73/5a04172aN29f845bf.jpg!q80.dpg.webp',
    'http://m.360buyimg.com/mobilecms/s843x843_jfs/t13438/360/124743365/49464/474ae43b/5a03ffaeNeb7db52b.jpg!q70.dpg.webp',
    'http://m.360buyimg.com/mobilecms/s843x843_jfs/t11485/251/1617504994/45865/1e52d881/5a03ff99Ne79b5ee9.jpg!q70.dpg.webp',
    'http://m.360buyimg.com/mobilecms/s843x843_jfs/t11140/344/1557119770/31087/d11c46ac/5a03ff9fNd553a907.jpg!q70.dpg.webp'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品详情')),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    height: 375.0,
                    child: Swiper(
                      itemCount: goodsImgs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(goodsImgs[index],
                            fit: BoxFit.fill);
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '¥7888',
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
                                  style: TextStyle(fontSize: 14.0),
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
                                    style: TextStyle(fontSize: 14.0),
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
                    'Apple 苹果x iPhonex 全面屏 手机 深空灰色 全网通  256G（白条免息）',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              GoodsTool()
            ],
          )),
    );
  }
}

class GoodsTool extends StatelessWidget {
  const GoodsTool({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Positioned(
        bottom: 10.0,
        left: 0.0,
        right: 0.0,
        child: Container(
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
