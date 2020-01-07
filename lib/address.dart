import 'package:first_flutter/model/index.dart';
import 'package:first_flutter/provider/addressModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'http/http.dart';
import 'edit_address.dart';

class AddressMain extends StatefulWidget {
  AddressMain({Key key}) : super(key: key);

  _AddressMainState createState() => _AddressMainState();
}

class _AddressMainState extends State<AddressMain> {
  List<AddressModel> _addressList = [];

  @override
  void initState() {
    _getList().then((res) {
      print(res);
      var address = List<AddressModel>.from(res.map((item) => AddressModel(
          item['userName'],
          item['phone'],
          item['province'],
          item['locationCode'],
          item['city'],
          item['area'],
          item['address'])));
      setState(() {
        _addressList = address;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 这个是在页面绘制完成后回调， 那个时候肯定是有context 的
        Provider.of<AddressData>(context).setAddressList(_addressList);
      });
    });
    super.initState();
  }

  Future _getList() async {
    return await HttpUtils.request(
        'https://www.fastmock.site/mock/b7b1c8dd0f5250ffc71c0d191e06758b/dio/getAddress');
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var addressList = Provider.of<AddressData>(context).addressList;
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('收货地址')),
          body: Builder(builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 55.0),
                    child: ListView.builder(
                      itemCount: addressList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xffe5e5e5)))),
                          child: addressList.length > 0
                              ? AddressItem(
                                  addressItem: addressList[index], index: index)
                              : Container(),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 15.0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Ink(
                          width: screenWidth - 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFff2000),
                                    Color(0xFFff4f18)
                                  ]),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditAddress(
                                            isNew: true,
                                          ))).then((res) => {
                                    if (res != null)
                                      {
                                        Scaffold.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('添加地址成功'),
                                        ))
                                      }
                                  });
                            },
                            child: Center(
                              child: Text(
                                '新建地址',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}

class AddressItem extends StatefulWidget {
  final AddressModel addressItem;
  int index;
  AddressItem({Key key, @required this.addressItem, @required this.index})
      : super(key: key);

  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  TextStyle boldText = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0);

  String hideMiddleNumber(String phone) {
    if (phone.length == 11) {
      return phone.replaceRange(3, 7, '****');
    }
    return phone;
  }

  @override
  Widget build(BuildContext context) {
    var addressData = Provider.of<AddressData>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      style: boldText,
                      text: '${widget.addressItem.userName}',
                      children: [
                        TextSpan(text: '    '),
                        TextSpan(
                            text:
                                '${hideMiddleNumber(widget.addressItem.phone)}')
                      ]),
                ),
                Text(
                  '${widget.addressItem.province}${widget.addressItem.city}${widget.addressItem.address}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 20.0,
                    color: Colors.blueGrey,
                  ),
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditAddress(
                                isNew: false, index: widget.index)));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
