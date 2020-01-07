import 'package:first_flutter/model/index.dart';
import 'package:flutter/foundation.dart';

//  定义一个地址管理的的widget
class AddressData with ChangeNotifier {
  List<AddressModel> addressList = [];
  setAddressList(data) {
    this.addressList = data;
    print('start set');
    print(this.addressList);
    notifyListeners();
  }

  get getAddressList => this.addressList;
}
