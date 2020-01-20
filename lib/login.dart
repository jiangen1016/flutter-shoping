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

  @override
  void initState() {
    super.initState();
  }

  var userName = TextEditingController();
  var userPass = TextEditingController();
  bool isRemmber = false;

  UnderlineInputBorder _focusedBorderStyle = UnderlineInputBorder(
      borderSide: BorderSide(
    color: Colors.blueAccent, //边框颜色为蓝色
    width: 2, //宽度为5
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('登录'),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            margin: EdgeInsets.only(top: 100),
            child: Form(
              key: loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Image.asset('lib/assets/logo.png'),
                      )),
                  TextFormField(
                    controller: userName,
                    decoration: InputDecoration(
                      // labelText: '用户名',
                      hintText: '用户名',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: _focusedBorderStyle,
                    ),
                    validator: (e) {
                      return e.length < 1 ? '用户名必须输入' : '';
                    },
                  ),
                  TextFormField(
                    controller: userPass,
                    obscureText: true,
                    decoration: InputDecoration(
                      // labelText: '密码',
                      hintText: '密码',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: _focusedBorderStyle,
                    ),
                    validator: (e) {
                      if (e.length < 1) {
                        return '密码必须输入';
                      } else if (e.length < 6) {
                        return '密码不能小于6位数';
                      }
                    },
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Transform(
                            transform: Matrix4.translationValues(-15, 0, 0),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                    value: isRemmber,
                                    activeColor: Colors.blueAccent,
                                    onChanged: (val) {
                                      setState(() {
                                        isRemmber = !isRemmber;
                                      });
                                    }),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isRemmber = !isRemmber;
                                    });
                                  },
                                  child: Text('记住密码'),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('点击了注册');
                            },
                            child: Text(
                              '注册',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ]),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: RaisedButton(
                                onPressed: _login,
                                padding: EdgeInsets.all(12),
                                child: Text('登录'),
                                textColor: Colors.white,
                                color: Colors.blueAccent,
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
