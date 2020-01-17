import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  void _login() {
    var loginFormController = loginKey.currentState;
    if (loginFormController.validate()) {
      print(userName.text);
      print(userPass.text);
    }
  }

  var userName = TextEditingController();
  var userPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Center(
        child: Container(
            width: 300,
            margin: EdgeInsets.only(top: 100),
            child: Form(
              key: loginKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: userName,
                    decoration: InputDecoration(labelText: '用户名'),
                    validator: (e) {
                      print(e.length);
                      return e.length < 1 ? '用户名必须输入' : '';
                    },
                  ),
                  TextFormField(
                    controller: userPass,
                    obscureText: true,
                    decoration: InputDecoration(labelText: '密码'),
                    validator: (e) {
                      return e.length < 1 ? '密码必须输入' : '';
                    },
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: RaisedButton(
                                onPressed: _login,
                                padding: EdgeInsets.all(12),
                                child: Text('登录'),
                                textColor: Colors.white,
                                color: Colors.redAccent,
                              ))
                        ],
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
