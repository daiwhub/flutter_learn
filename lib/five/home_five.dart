import 'package:flutter/material.dart';
import 'package:flutter_learn/five/change_fonts.dart';
import 'package:flutter_learn/five/change_theme.dart';
import 'package:flutter_learn/five/less_group_page.dart';
import 'package:flutter_learn/five/photo_app_page.dart';
import 'package:flutter_learn/five/stateful_group_page.dart';
import 'package:flutter_learn/six/widget/image/widget_image.dart';
import 'package:flutter_learn/widget/base_state.dart';

///第5章 Flutter入门
class HomePageFive extends StatefulWidget {
  var isName;
  var brightness;
  HomePageFive({Key key,this.isName = false,this.brightness = Brightness.light}): super(key : key);
  @override
  _HomePageFiveState createState() => _HomePageFiveState();
}

class _HomePageFiveState extends BaseStateCustom<HomePageFive> {
  String title = '第5章 Flutter入门';
  int _crossAxisCount = 2 ;
  @override
  Widget build(BuildContext context) {
    return createMaterialApp(widget.brightness, title, _crossAxisCount);
  }

  @override
  List<Widget> createItems() {
    List<Widget> items = [];
    items.add(createItem('StatelessWidget与基础组件', LessGroupPage(brightness: widget.brightness,), 'less'));
    items.add(createItem('StatefulWidget基础组件', StatefulGroupPage(brightness: widget.brightness,), 'ful'));
    items.add(createItem('自定义主题', ChangeTheme(brightness: widget.brightness,), 'change_theme'));
    items.add(createItem('自定义字体', ChangeFonts(brightness: widget.brightness,), 'change_fonts'));
    items.add(createItem('拍照APP开发-图片获取与图片展示', PhotoApp(brightness: widget.brightness,), 'photo'));

    return items;
  }

  @override
  Map<String, WidgetBuilder> createRoutes() {
    Map<String,WidgetBuilder> routes = new Map();
    routes['less'] = (BuildContext context) => LessGroupPage(brightness: widget.brightness);
    routes['ful'] = (BuildContext context) => StatefulGroupPage(brightness: widget.brightness);
    routes['change_theme'] = (BuildContext context) => ChangeTheme(brightness: widget.brightness);
    routes['change_fonts'] = (BuildContext context) => ChangeFonts(brightness: widget.brightness);

    return routes;
  }

  @override
  bool getIsName() {
    return widget.isName;
  }


}
