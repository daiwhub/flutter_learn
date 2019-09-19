import 'package:flutter/material.dart';
import 'package:flutter_learn/five/change_fonts.dart';
import 'package:flutter_learn/five/change_theme.dart';
import 'package:flutter_learn/five/less_group_page.dart';
import 'package:flutter_learn/five/photo_app_page.dart';
import 'package:flutter_learn/five/stateful_group_page.dart';
import 'package:flutter_learn/seven/drawer_widget.dart';
import 'package:flutter_learn/seven/tabbar_widget.dart';
import 'package:flutter_learn/six/widget/image/widget_image.dart';
import 'package:flutter_learn/widget/base_state.dart';

///第5章 Flutter入门
class HomePageSeven extends StatefulWidget {
  var isName;
  var brightness;
  HomePageSeven({Key key,this.isName = false,this.brightness = Brightness.light}): super(key : key);
  @override
  _HomePageSevenState createState() => _HomePageSevenState();
}

class _HomePageSevenState extends BaseStateCustom<HomePageSeven> {
  String title = '第7章 Flutter入门实战';
  int _crossAxisCount = 2 ;
  @override
  Widget build(BuildContext context) {
    return createMaterialApp(widget.brightness, title, _crossAxisCount);
  }

  @override
  List<Widget> createItems() {
    List<Widget> items = [];
    items.add(createItem('TabBar顶部导航', TabBarWidget(brightness: widget.brightness,), 'tabbar'));
    items.add(createItem('Drawer侧拉菜单', DrawerWidget(brightness: widget.brightness,), 'drawer'));

    return items;
  }

  @override
  Map<String, WidgetBuilder> createRoutes() {
    Map<String,WidgetBuilder> routes = new Map();
    routes['tabbar'] = (BuildContext context) => TabBarWidget(brightness: widget.brightness);
    routes['drawer'] = (BuildContext context) => DrawerWidget(brightness: widget.brightness);

    return routes;
  }

  @override
  bool getIsName() {
    return widget.isName;
  }


}
