import 'package:first_flutter/car.dart';
import 'package:first_flutter/index.dart';
import 'package:first_flutter/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/addressModel.dart';

void main() => runApp(ChangeNotifierProvider.value(
      value: AddressData(),
      child: Shopping(),
    ));

class Shopping extends StatefulWidget {
  Shopping({Key key}) : super(key: key);
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  int selectBar = 0;
  String titleName = '商城';

  List<Widget> _widgetOptions = [];

  final pageController = PageController();

  void initState() {
    super.initState();
    _widgetOptions..add(Index())..add(MyCart(isFromBar: true))..add(User());
  }

  _onItemTapped(int index) {
    setState(() {
      // selectBar = index;  // 没有用保持状态的写法
      pageController.jumpToPage(index);
      switch (selectBar) {
        case 0:
          titleName = '京东商城';
          break;
        case 1:
          titleName = '购物车';
          break;
        case 2:
          titleName = '用户中心';
          break;
      }
    });
  }

  void onPageChanged(int index) {
    setState(() {
      selectBar = index;
    });
  }

  getSearchItem() {
    if (selectBar == 0) {
      return SearchItem();
    } else {
      return Container();
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: '京东商城',
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text(titleName),
          actions: <Widget>[getSearchItem()],
        ),
        // body: _widgetOptions[selectBar],
        // 这个可以，但是会同时初始化所有界面
        // body: IndexedStack(
        //   index: selectBar,
        //   children: _widgetOptions,
        // ),
        // 这个可以，但是会同时初始化所有界面
        // body: Stack(
        //   children: <Widget>[
        //     Offstage(
        //       offstage: selectBar != 0,
        //       child: _widgetOptions[0],
        //     ),
        //     Offstage(
        //       offstage: selectBar != 1,
        //       child: _widgetOptions[1],
        //     ),
        //     Offstage(
        //       offstage: selectBar != 2,
        //       child: _widgetOptions[2],
        //     ),
        //   ],
        // ),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text('购物车'), icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(
                title: Text('我的'), icon: Icon(Icons.person)),
          ],
          selectedItemColor: Colors.red,
          currentIndex: selectBar,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          print(query);
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('123');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.toString();
    final isEmpty = query.isEmpty;
    if (isEmpty) {
      return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SuggestionTags(tagList: [
            '辣鸡风景',
            '辣鸡二狗',
            '辣鸡大牙',
            '辣鸡风景',
            '辣鸡二狗',
            '辣鸡大牙',
            '辣鸡风景',
            '辣鸡二狗'
          ]));
    } else {
      return ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(suggestionList),
                subtitle: Text(index.toString()),
              ),
            );
          });
    }
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          print('打开搜索啊');
          showSearch(context: context, delegate: SearchBarDelegate());
        },
      ),
    );
  }
}

class TagItem extends StatelessWidget {
  final String text;
  const TagItem({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(text);
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
    );
  }
}

class SuggestionTags extends StatelessWidget {
  final List tagList;
  SuggestionTags({Key key, @required this.tagList}) : super(key: key);

  List<Widget> getTag() {
    if (tagList.length > 0) {
      return tagList.map((item) => TagItem(text: item)).toList();
    } else {
      return List()
        ..add(TagItem(
          text: '暂无搜索',
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: getTag(),
      ),
    );
  }
}
