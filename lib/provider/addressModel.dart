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

  removeAddressList(int index) {
    this.addressList.removeAt(index);
    notifyListeners();
  }

  addAddrssItem(AddressModel address) {
    this.addressList.add(address);
    notifyListeners();
  }

  editAddressItem(int index, AddressModel address) {
    this.addressList.removeAt(index);
    this.addressList.insert(index, address);
  }

  get getAddressList => this.addressList;
}
