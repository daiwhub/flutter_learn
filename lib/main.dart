import 'package:flutter/material.dart';
import 'package:flutter_learn/change_fonts.dart';
import 'package:flutter_learn/change_theme.dart';
import 'package:flutter_learn/less_group_page.dart';
import 'package:flutter_learn/stateful_group_page.dart';

void main() => runApp(MyApp());

var brightness = Brightness.dark;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: brightness),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        "less": (BuildContext context) => LessGroupPage(brightness: brightness),
        "ful": (BuildContext context) => StatefulGroupPage(
              brightness: brightness,
            ),
        'change_theme' : (BuildContext context) => ChangeTheme(brightness: brightness,),
        'change_fonts' : (BuildContext context) => ChangeFonts(brightness: brightness,),
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
  bool _isLight = true;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              value: _isRouteName,
              onChanged: (value) {
                setState(() {
                  _isRouteName = value;
                });
              },
              title: Text('${_isRouteName ? '' : "不"}使用路由名称进行跳转'),
            ),
            _items(
                'StatelessWidget与基础组件',
                LessGroupPage(
                  brightness: brightness,
                ),
                'less'),
            _items('StatefulWidget基础组件',
                StatefulGroupPage(brightness: brightness), 'ful'),
            _items('自定义主题',
                ChangeTheme(brightness: brightness,), 'change_theme'),
             _items('自定义字体',
                ChangeFonts(brightness: brightness,), 'change_fonts'),

          ],
        ),
      ),
    );
  }

  _items(String title, page, String routeName) {
    return RaisedButton(
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
    );
  }
}
