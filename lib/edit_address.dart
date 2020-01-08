import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:first_flutter/provider/addressModel.dart';
import 'package:provider/provider.dart';
import 'package:city_pickers/city_pickers.dart';

import 'model/index.dart';

class EditAddress extends StatefulWidget {
  bool isNew;
  int index;
  EditAddress({Key key, this.isNew, this.index}) : super(key: key);

  _EditAddressState createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var addressData = Provider.of<AddressData>(context);
    // print(widget.index);
    // print(addressData.addressList[widget.index]);

    return Scaffold(
      appBar: AppBar(
        title: Text('编辑收货地址'),
        actions: <Widget>[
          !widget.isNew
              ? FlatButton(
                  child: Text('删除',
                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  onPressed: () {
                    showDialog<Null>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('删除'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('确定删除该地址？'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('确定'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Provider.of<AddressData>(context)
                                    .removeAddressList(widget.index); // 关闭弹窗
                                Navigator.of(context).pop('删除成功');
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
                )
              : Container()
        ],
      ),
      body: AddressForm(
        index: widget.index,
      ),
      // body: Provider(
      //   builder: () => {},
      //   child: AddressForm(
      //     index: widget.index,
      //   ),
      // )
      // ChangeNotifierProvider<AddressData>.value(
      //   value: AddressData(),
      //   child:
      // ),
    );
  }
}

class AddressForm extends StatefulWidget {
  int index;
  AddressForm({Key key, @required this.index}) : super(key: key);

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _address = TextEditingController();
  AddressModel currentUser;
  var _isDefaultAddress = false;
  String _locationCode;
  GlobalKey _formKey = new GlobalKey<FormState>();

  _showCistPicker() async {
    print(_locationCode);
    Result result = await CityPickers.showCityPicker(
        context: context, locationCode: _locationCode);
    print(result);
    if (result != null) {
      _city.text = '${result.provinceName + result.cityName + result.areaName}';
      setState(() {
        _locationCode = result.areaId;
      });
    }
  }

  _submitAddress(BuildContext context) {
    //  如果是Form的自组件，可以直接调用这个方法
    // if (Form.of(context).validate()) {
    //   print('可以提交');
    // }
    var currentForm = (_formKey.currentState as FormState);
    if (currentForm.validate()) {
      currentForm.save();
      print('可以提交');
      print(
          '${_name.text}、${_phone.text}、${_city.text}、${_address.text}、${_isDefaultAddress.toString()}');
      Navigator.of(context).pop('添加地址成功');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 这个是在页面绘制完成后回调， 那个时候肯定是有context 的
      currentUser = Provider.of<AddressData>(context).addressList[widget.index];
      print(currentUser);
      _name.text = currentUser.userName;
      _address.text = currentUser.address;
      _city.text = currentUser.province + currentUser.city + currentUser.area;
      _phone.text = currentUser.phone;
      _locationCode = currentUser.locationCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 10.0),
      child: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidate: false,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60.0,
                          child: Text('收货人'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            child: TextFormField(
                              controller: _name,
                              validator: (v) {
                                if (v.trim().length <= 0) {
                                  return '收货人不能为空';
                                }
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '请填写收货人姓名',
                                  suffixIcon: Icon(Icons.person_add)),
                              onChanged: (v) {},
                              onSaved: (v) {},
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60.0,
                          child: Text('手机号码'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            child: TextFormField(
                              controller: _phone,
                              validator: (v) {
                                if (v.trim().length <= 0) {
                                  return '手机号码不能为空';
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '请填写收货人手机号'),
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60.0,
                          child: Text('所在地区'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            child: TextFormField(
                              controller: _city,
                              onTap: _showCistPicker,
                              validator: (v) {
                                if (v.trim().length <= 0) {
                                  return '所在地区不能为空';
                                }
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '省市区县、乡镇等'),
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 60.0,
                          margin: const EdgeInsets.only(top: 14.0),
                          child: Text('详细地址'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // decoration: BoxDecoration(border: Border.all()),
                            alignment: Alignment.topCenter,
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            child: TextFormField(
                              controller: _address,
                              maxLines: 4,
                              validator: (v) {
                                if (v.trim().length <= 0) {
                                  return '详细地址不能为空';
                                }
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '街道、楼牌号等'),
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60.0,
                          child: Text('标签'),
                        ),
                        Wrap(
                          children: <Widget>[
                            ChoiceChip(
                              label: Text(
                                '家',
                                style: TextStyle(color: Colors.white),
                              ),
                              selected: true,
                              selectedColor: Colors.redAccent,
                              onSelected: (bool selected) {},
                            ),
                            ChoiceChip(
                              label: Text('公司',
                                  style: TextStyle(color: Colors.black)),
                              selected: false,
                              backgroundColor: Color(0xffdcdcdc),
                              selectedColor: Colors.redAccent,
                              onSelected: (bool selected) {},
                            ),
                            ChoiceChip(
                              label: Text('学校',
                                  style: TextStyle(color: Colors.black)),
                              selected: false,
                              backgroundColor: Color(0xffdcdcdc),
                              selectedColor: Colors.redAccent,
                              onSelected: (bool selected) {},
                            )
                          ],
                        )
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text('设为默认地址'),
                        ),
                        CupertinoSwitch(
                          activeColor: Colors.redAccent,
                          value: _isDefaultAddress,
                          onChanged: (bool value) {
                            setState(() {
                              _isDefaultAddress = value;
                            });
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Positioned(
              bottom: 15.0,
              left: 0,
              right: 0,
              child: Container(
                  alignment: Alignment.center,
                  child: Ink(
                    width: 300.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFFff2000), Color(0xFFff4f18)]),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: InkWell(
                      onTap: () {
                        _submitAddress(context);
                      },
                      child: Center(
                        child: Text(
                          '保存地址',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )))
        ],
      ),
    ));
  }
}
