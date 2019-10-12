import 'package:flutter/material.dart';

import 'edit_address.dart';

class AddressMain extends StatefulWidget {
  AddressMain({Key key}) : super(key: key);

  _AddressMainState createState() => _AddressMainState();
}

class _AddressMainState extends State<AddressMain> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('收货地址')),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 55.0),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Color(0xffe5e5e5)))),
                      child: AddressItem(),
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
                              colors: [Color(0xFFff2000), Color(0xFFff4f18)]),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditAddress()));
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
        ),
      ),
    );
  }
}

class AddressItem extends StatefulWidget {
  AddressItem({Key key}) : super(key: key);

  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  TextStyle boldText = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
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
                  text: TextSpan(style: boldText, text: '姜恩', children: [
                    TextSpan(text: '    '),
                    TextSpan(text: '176****9920')
                  ]),
                ),
                Text(
                  '湖北省武汉市洪山区这个街道那个小区旁边这栋上面那层里面的那个房间',
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditAddress()));
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
