import 'dart:io' as prefix0;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

///图片控件开发详解
class ImageWidget extends StatefulWidget {
  var brightness;

  ImageWidget({Key key, this.brightness = Brightness.light}) : super(key: key);

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  String title = '图片控件开发详解';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme:
          ThemeData(primaryColor: Colors.blue, brightness: widget.brightness),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: <Widget>[
              //加载网络图片
              _loadImageNetwork(),
              //加载静态图片
              _loadImageAssets(1),
              _loadImageAssets(2),
              //加载本地图片
              _loadImageStorage(),
            ],
          ),
        ),
      ),
    );
  }

  ///加载网络图片
  _loadImageNetwork() {
    return Image.network(
      'http://www.devio.org/img/avatar.png',
      width: 120,
      height: 120,
      fit: BoxFit.fill,
    );
  }

  ///加载静态图片
  _loadImageAssets(int flag) {
    return flag == 1
        ? Image(
            image: AssetImage('images/douzhanshen/changan.jpg'),
            width: 120,
            height: 120,
            fit: BoxFit.fill,
          )
        : Image.asset(
            'images/douzhanshen/baigu.jpg',
            width: 120,
            height: 120,
            fit: BoxFit.fill,
          );
  }

  ///加载本地图片
  _loadImageStorage() {
    return FutureBuilder(
      future: _getLocalFile('Download/linghou.jpg'),
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        return snapshot.data != null
            ? Image.file(
                snapshot.data,
                width: 120,
                height: 120,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'images/image_load_failed.jpeg',
                width: 120,
                height: 120,
                fit: BoxFit.fill,
              );
      },
    );
  }

  ///获取SDCard的路径
  Future<File> _getLocalFile(String fileName) async {
    String dir = (await getExternalStorageDirectory()).path;
    print('getExternalStorageDirectory : $dir');
    File file = new File('$dir/$fileName');
    return file;
  }
}
