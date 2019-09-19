import 'package:flutter/material.dart';
import 'package:flutter_learn/widget/gesture_detector_back.dart';

///搭了个框架】APP首页框架搭建-Scaffold之Drawer侧拉菜单
class DrawerWidget extends StatefulWidget {
  final Brightness brightness;
  DrawerWidget({Key key,this.brightness = Brightness.light}) : super(key :key);
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final String title = 'Drawer侧拉菜单';
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.blue,brightness: widget.brightness),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: GestureDetectorBackWidget.getBackWidget(context),
        ),
        body: Center(
          child: Text('My Page'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child: Text('Drawer Header'),
              decoration: BoxDecoration(color: Colors.blue),),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('设置'),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('语言'),
                onTap: () {
                  SnackBar(content: Text('语言'));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
