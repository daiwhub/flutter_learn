import 'package:flutter/material.dart';
import 'package:flutter_learn/six/animated/animation_hero.dart';
import 'package:flutter_learn/six/widget/image/widget_image.dart';
import 'package:flutter_learn/widget/base_state.dart';

///第6章 Flutter入门：Flutter必备基础【修炼基本功】
class HomePageSix extends StatefulWidget {
  var brightness;
  var isName;

  HomePageSix(
      {Key key, this.isName = false, this.brightness = Brightness.light})
      : super(key: key);

  @override
  _HomePageSixState createState() => _HomePageSixState();
}

class _HomePageSixState extends BaseStateCustom<HomePageSix> {
  String title = '第6章 Flutter入门';
  int crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    return createMaterialApp(widget.brightness, title, crossAxisCount);
  }

  @override
  bool getIsName() {
    return widget.isName;
  }

  @override
  List<Widget> createItems() {
    List<Widget> items = [];
    items.add(createItem(
        '6-4 【技能储备】图片控件开发详解',
        ImageWidget(
          brightness: widget.brightness,
        ),
        'widget_image'));
    items.add(createItem(
        '6-9 【装逼必备】动画Animation开发指南-Hero动画-1',
        AnimationHero(
          brightness: widget.brightness,
        ),
        'animation_hero'));

    return items;
  }

  @override
  Map<String, WidgetBuilder> createRoutes() {
    Map<String, WidgetBuilder> routes = Map<String, WidgetBuilder>();
    routes['widget_image'] =
        (BuildContext context) => ImageWidget(brightness: widget.brightness);
    routes['animation_hero'] =
        (BuildContext context) => AnimationHero(brightness: widget.brightness);

    return routes;
  }
}
