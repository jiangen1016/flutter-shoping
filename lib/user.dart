import 'package:flutter/material.dart';

void main() => runApp(User());

class User extends StatefulWidget {
  User({Key key}) : super(key: key);

  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[UserTile()],
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
