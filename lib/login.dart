import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  var userName = TextEditingController();
  var userPass = TextEditingController();
  bool isRemmber = false;
  bool _isLogin = false;
  String _userName = '';
  String _userPass = '';

  void _login() {
    var loginFormController = loginKey.currentState;
    if (loginFormController.validate()) {
      print(userName.text);
      print(userPass.text);
      setState(() {
        _isLogin = true;
      });
      Future.delayed(Duration(seconds: 2)).then((res) {
        setState(() {
          _isLogin = false;
        });
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => Shopping()),
            (route) => route == null);
      });
    } else {}
  }

  UnderlineInputBorder _focusedBorderStyle = UnderlineInputBorder(
      borderSide: BorderSide(
    color: Colors.black, //边框颜色为黑色
    width: 1, //宽度为5
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blueAccent,
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
                      margin: EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Image.asset('lib/assets/logo.png'),
                      )),
                  TextFormField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(
                            // 设置内容
                            text: _userName,
                            // 保持光标在最后
                            selection: TextSelection.fromPosition(TextPosition(
                                affinity: TextAffinity.downstream,
                                offset: _userName.length)))),
                    decoration: InputDecoration(
                      // labelText: '用户名',
                      hintText: '用户名',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: _focusedBorderStyle,
                    ),
                    onChanged: (val) {
                      setState(() {
                        _userName = val;
                      });
                    },
                    validator: (e) {
                      print(e.length);
                      if (e.length < 1) {
                        return '用户名必须输入';
                      } else if (e.length < 6) {
                        return '用户名不能小于6位数';
                      }
                    },
                  ),
                  Container(
                    height: 20,
                  ),
                  TextFormField(
                    controller: TextEditingController.fromValue(
                        TextEditingValue(
                            text: _userPass,
                            selection: TextSelection.fromPosition(TextPosition(
                                affinity: TextAffinity.downstream,
                                offset: _userPass.length)))),
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
                    onChanged: (val) {
                      setState(() {
                        _userPass = val;
                      });
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
                                    activeColor: Colors.redAccent,
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
                              print('点击了忘记密码');
                            },
                            child: Text(
                              '忘记密码',
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
                                color: Colors.redAccent,
                              ))
                        ],
                      )),
                  _isLogin
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: CupertinoActivityIndicator(
                              radius: 20.0,
                              animating: _isLogin,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            )),
      ),
    );
  }
}
