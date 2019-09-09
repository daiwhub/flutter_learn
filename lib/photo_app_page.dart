import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///拍照APP开发-图片获取与图片展示
class PhotoApp extends StatefulWidget {
  var brightness;

  PhotoApp({Key key, this.brightness = Brightness.light}) : super(key: key);

  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  String title = '拍照APP开发-图片获取与图片展示';

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(brightness: widget.brightness),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Pick image',
            child: Icon(
              Icons.add_a_photo,
            )),
        body: Wrap(
          children: <Widget>[
              Image.file(_image != null ? _image : File('images/icon_light.pn'))
          ],
        ),
      ),
    );
  }
}
