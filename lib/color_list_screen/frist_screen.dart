import 'package:flutter/material.dart';
import 'package:flutaro/color_list_screen/select_color_screen.dart';

class FristScreen extends StatefulWidget {

  @override
  _FristScreenState createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  @override
  Widget build(BuildContext context) {
    var _deviceData = MediaQuery.of(context); //デバイスの情報を取得
    var _deviceHeight = _deviceData.size.height; //デバイスの高さを取得
    var _deviceWidth = _deviceData.size.width;
    return Scaffold(
      appBar: AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    SelectColorScreen()
                ),
              );},
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "Hellow from Japan"
        ),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
