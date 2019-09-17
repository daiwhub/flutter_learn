import 'package:flutter/material.dart';
import 'package:flutter_learn/five/home_five.dart';
import 'package:flutter_learn/seven/home_seven.dart';
import 'package:flutter_learn/six/home_six.dart';

void main() => runApp(MyApp());

var brightness = Brightness.light;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: brightness),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        "five": (BuildContext context) => HomePageFive(brightness: brightness),
        "six": (BuildContext context) => HomePageSix(brightness: brightness),
        "seven": (BuildContext context) => HomePageSeven(brightness: brightness),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isRouteName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: brightness == Brightness.light
                ? Image.asset('images/icon_light.png')
                : Image.asset('images/icon_night.png'),
            onPressed: () {
              setState(() {
                if (brightness == Brightness.light) {
                  brightness = Brightness.dark;
                } else {
                  brightness = Brightness.light;
                }
              });
            },
          ),
        ],
      ),
      body: _createListView(),
    );
  }

  _createListView() {
    return ListView(
      children: <Widget>[
        _createListViewHeader(),
        _items(
            '第5章 Flutter入门：基础知识十六讲【升级打怪不可缺】',
            HomePageFive(
              brightness: brightness,
            ),
            'five'),
        _items(
            '第6章 Flutter入门：Flutter必备基础【修炼基本功】',
            HomePageSix(
              brightness: brightness,
            ),
            'six'),
        _items(
            '第7章 Flutter入门实战：APP导航框架与常用功能实现【先打一仗，巩固技能】',
            HomePageSeven(
              brightness: brightness,
            ),
            'seven'),
      ],
    );
  }

  _createListViewHeader() {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: SwitchListTile(
        value: _isRouteName,
        onChanged: (value) {
          setState(() {
            _isRouteName = value;
          });
        },
        title: Text('${_isRouteName ? '' : "不"}使用路由名称进行跳转'),
      ),
    );
  }

  _items(String title, page, String routeName) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: RaisedButton(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        elevation: 5,
        onPressed: () => {
          if (_isRouteName)
            {
              //使用路由名进行跳转
              Navigator.pushNamed(context, routeName)
            }
          else
            {
              //不使用路由名进行跳转
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page))
            }
        },
        child: Text(title),
      ),
    );
  }
}
