import 'package:first_flutter/data/some_data.dart';
import 'package:first_flutter/detail.dart';
import 'package:first_flutter/model/index.dart';
import 'package:first_flutter/widgets/advice.dart';
import 'package:first_flutter/widgets/category.dart';
import 'package:first_flutter/widgets/goods.dart';
import 'package:first_flutter/widgets/image.dart';
import 'package:first_flutter/widgets/sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(Index());

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with AutomaticKeepAliveClientMixin {
  List<String> imageUrls;

  List<CategoryItem> categoryList;

  List<Advice> adviceList;

  List<Sales> salesList;

  List<Goods> goodsList;

  @override
  bool get wantKeepAlive => true;

  //  点击的banner的第几个
  _onBannerTap(index) {
    print(index);
  }

  Widget _getGift() {
    return Row(
      children: <Widget>[
        Expanded(
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              child: Image.network(
                  'http://m.360buyimg.com/mobilecms/s376x240_jfs/t1/49601/16/12206/115887/5d91b4d5E34709952/aba2bcb4855e6e52.png!q70.jpg.dpg')),
        ),
        Expanded(
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              child: Image.network(
                  'http://m.360buyimg.com/mobilecms/s376x240_jfs/t1/32449/33/15631/174497/5cc2d86bE0289110c/9c53e25651659d43.png!q70.jpg.dpg')),
        ),
      ],
    );
  }

  initState() {
    super.initState();
    print('index page init');
    this.categoryList = returnCategoryList;
    this.imageUrls = returnImageUrls;
    this.adviceList = returnAdviceList;
    this.salesList = returnSalesList;
    this.goodsList = returnGoodsList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
              height: 150.0,
              child: Swiper(
                itemHeight: 50.0,
                containerHeight: 50.0,
                onTap: _onBannerTap,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print(imageUrls[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoodsDetail()));
                    },
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.fill,
                    ),
                  );
                },
                itemCount: imageUrls.length,
                autoplay: true,
                loop: true, // 是否循环
                autoplayDelay: 3000, // 自动播放延迟
                pagination: SwiperPagination(), // 分页显示
              )),
          Wrap(
            children: categoryList
                .map((item) => Category(categoryItem: item))
                .toList(),
          ),
          Container(
              height: 160.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: salesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SalesItem(sales: salesList, index: index);
                },
              )),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: _getGift(),
          ),
          SetImage().mgNetwork(
              'https://m.360buyimg.com/mobilecms/s750x80_jfs/t1/39486/28/9224/23804/5d09048aE5127de40/eec779757a34e94d.png!q70.jpg.dpg'),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: adviceList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 2 / 3),
            itemBuilder: (BuildContext context, int index) {
              return AdviceItem(adviceList: adviceList, index: index);
            },
          ),
          Image.network(
            'http://img11.360buyimg.com/jdphoto/jfs/t1/31601/22/15554/14040/5cc2a86fEbdb1098b/88174b36f85283b6.png',
            fit: BoxFit.fill,
          ),
          GridView.builder(
            padding: EdgeInsets.all(0),
            physics: new NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: goodsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 2 / 3),
            itemBuilder: (BuildContext context, int index) {
              return GoodsItem(
                goodList: goodsList,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
