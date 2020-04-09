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

  Function a(old, now) {}

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
            : ReorderableListView(children: [
                ListTile(
                  key: ValueKey('0'),
                  title: Text(_result),
                ),
                ListTile(
                  key: ValueKey('1'),

                  title: Text(_result),
                ),
                ListTile(
                  key: ValueKey('2'),

                  title: Text(_result),
                ),
                ListTile(
                  key: ValueKey('3'),

                  title: Text(_result),
                ),
                ListTile(
                  key: ValueKey('4'),

                  title: Text(_result),
                ),
                ListTile(
                  key: ValueKey('5'),

                  title: Text(_result),
                )
              ], onReorder: a));

    // ListView.builder(
    //     itemCount: 10,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: ListTile(
    //           title: Text(_result),
    //         ),
    //       );
    //     }),
  }
}
