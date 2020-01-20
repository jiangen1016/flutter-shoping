import 'package:first_flutter/model/index.dart';
import 'package:flutter/foundation.dart';

//  定义一个共享数据的widget
class CarData with ChangeNotifier {
  List<CarItem> _carList;
  CarData(this._carList);

  // 商品选中不选中
  valueChanged(index) {
    _carList[index].isChoosed = !_carList[index].isChoosed;
    getTotalPrice();
    notifyListeners();
  }

  bool isEmpty() {
    return _carList.length < 1 ? true : false;
  }

  delItem(int index) {
    _carList.removeAt(index);
    notifyListeners();
  }

  // 计算总金额
  getTotalPrice() {
    var getChooseGoods =
        _carList.where((item) => item.isChoosed == true).toList();

    return getChooseGoods.fold(
        0, (prev, item) => prev + item.goodsPrice * item.goodCount);
  }

  changeCountForModal(int index, int count) {
    _carList[index].goodCount = count;
    notifyListeners();
  }

  // 改变商品数量
  changeGoodsCount(int index, String addType, int number) {
    if (addType == '-') {
      _carList[index].goodCount == 1
          ? _carList[index].goodCount = 1
          : _carList[index].goodCount--;
    } else if (addType == '+') {
      _carList[index].goodCount++;
    } else {
      _carList[index].goodCount = number;
    }
    notifyListeners();
  }

  // 全选和全不选
  chooseAll() {
    var _isChooseAll = _carList.every((item) => item.isChoosed);
    _carList.forEach((item) => item.isChoosed = !_isChooseAll);
    notifyListeners();
  }

  get carList => _carList;
  set carlist(res) {
    this._carList = res;
    notifyListeners();
  }

  double get totalPrice => getTotalPrice().toDouble();
  bool get isChooseAll => _carList.every((item) => item.isChoosed);
}
