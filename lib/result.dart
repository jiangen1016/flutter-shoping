import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String _result = '搜索中';
  bool _hasSearch = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((res) {
      setState(() {
        _result = '搜索结果';
        _hasSearch = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _hasSearch
          ? Center(
              child:
                  //  CupertinoActivityIndicator(
                  //   radius: 30.0,
                  //   animating: false,
                  // ),
                  Loading(
                      indicator: BallPulseIndicator(),
                      size: 100.0,
                      color: Colors.grey),
            )
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(_result),
                  ),
                );
              }),
    );
  }
}
