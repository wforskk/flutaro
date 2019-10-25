import 'package:flutaro/module/color_data.dart';
import 'package:flutaro/color_list_screen/color_detail_screen.dart';
import 'package:flutter/material.dart';

class SelectColorScreen extends StatefulWidget {

  final String title = "";

  @override
  _SelectColorScreenState createState() => _SelectColorScreenState();
}

class _SelectColorScreenState extends State<SelectColorScreen> {

  var _gridData = <Widget>[];
  void initState() {
    //イテレートしてループ処理しようとしたが色の文字列（red,blue）を取り出せなかったのでListの要素数でループ処理する。
    for (int listCount = 0; listCount < colorData.length; listCount++) {
      var containers = Container(
        child: FlatButton(
          color: colorData[listCount].color,
          textColor: Colors.black,
          //ボタンが無効な時の色（今回は使わない予定）
          //disabledColor: Colors.grey,
          //disabledTextColor: Colors.white,
          splashColor: Colors.white30,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ColorDetail(
                      colorData[listCount])
              ),
            );},
          //shapeの中にRoundedRectangleBorder（形状を作る）があって、その中のborderRadiusにRadius値を設定する。
          shape: RoundedRectangleBorder(borderRadius: const BorderRadius.all(Radius.elliptical(40, 40)),
          ),
          child: Text(
            colorData[listCount].colorIconName.substring(7),
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
          ),
        ),
      );
      _gridData.add(containers);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context); //デバイスの情報を取得
    var deviceHeight = deviceData.size.height; //デバイスの高さを取得
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: deviceHeight * 0.8,
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          padding: const EdgeInsets.all(10.0),
          children: _gridData,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
