class Advice {
  String name;
  String subName;
  String url;

  Advice(this.name, this.subName, this.url);
}

class Sales {
  String imgUrl;
  dynamic price;
  dynamic salesPrice;
  Sales(this.salesPrice, this.price, this.imgUrl);
}

class Goods {
  String title;
  dynamic price;
  String url;
  Goods(this.title, this.price, this.url);
}

class CategoryItem {
  String icon;
  String title;
  CategoryItem(this.title, this.icon);
}

class CarItem {
  String goodsName;
  dynamic goodsPrice;
  String goodsImg;
  int goodCount;
  bool isChoosed;
  CarItem(this.goodsName, this.goodsPrice, this.goodCount, this.goodsImg);
}
