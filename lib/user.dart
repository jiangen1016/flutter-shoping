import 'package:first_flutter/address.dart';
import 'package:first_flutter/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:provider/provider.dart';
// import 'provider/addressModel.dart';

void main() => runApp(User());

class User extends StatefulWidget {
  User({Key key}) : super(key: key);

  _UserState createState() => _UserState();
}

class _UserState extends State<User> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    print('user page init');
    super.initState();
  }

  final _borderStyle = BoxDecoration(
      border: Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5))));

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            UserTile(),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddressMain()));
                  },
                  child: Container(
                      child: ListTile(
                        title: Text('我的地址'),
                      ),
                      decoration: _borderStyle),
                ),
                GestureDetector(
                  onTap: () {
                    print('关于');
                    _launchURL();
                  },
                  child: Container(
                    child: ListTile(
                      title: Text('关于商城'),
                    ),
                    decoration: _borderStyle,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text('退出'),
                            content: Text('是否退出当前登录?'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text('是'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text('否'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                  child: Container(
                      child: ListTile(
                        title: Text('退出登录'),
                      ),
                      decoration: _borderStyle),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.shinetechchina.com.cn/';
    // const url = 'tel:+1 555 010 999';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('无法打开url');
    }
    //  else {
    //   throw 'Could not launch $url';
    // }
  }
}

class UserTile extends StatelessWidget {
  const UserTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 36.0,
              backgroundImage: AssetImage('lib/assets/header.png'),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '花者不酷',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0),
                  ),
                  Text('17671469921')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
