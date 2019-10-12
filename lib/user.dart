import 'package:flutter/material.dart';

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
                  child: Container(
                      child: ListTile(
                        title: Text('我的地址'),
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Color(0xffe5e5e5))))),
                )
              ],
            )
          ],
        ),
      ),
    );
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
