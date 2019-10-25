import 'package:flutaro/module/color_data.dart';
import 'package:flutter/material.dart';

class ColorDetail extends StatefulWidget {
  final ColorData colorData;
  ColorDetail(this.colorData) : super();

  @override
  _ColorDetailState createState() => _ColorDetailState();
}

class _ColorDetailState extends State<ColorDetail> {
  @override
  Widget build(BuildContext context) {
    var _deviceData = MediaQuery.of(context); //デバイスの情報を取得
    var _deviceHeight = _deviceData.size.height; //デバイスの高さを取得
    var _deviceWidth = _deviceData.size.width;
    var _detailData = <Widget>[];
    var _normalColor = [100, 200, 300, 400, 'default', 600, 700, 800, 900];
    var _accentColor = [100, 'default', 400, 700];
    var _makeColorWidget = [];
    var _imageLogo = <Widget>[];
    var _decorationColor = <Color>[];
    var _colorBarWidth = _deviceWidth;

    if (widget.colorData.accentFlg == '0') {
      _makeColorWidget = _normalColor;

      _imageLogo.add(
        FlutterLogo(
          colors: widget.colorData.color,
          size: _deviceHeight * 0.2,
        ),
      );

      _colorBarWidth = _deviceWidth * 2 / 3;
    } else {
      _makeColorWidget = _accentColor;
    }

    for (var widgetCount = 0;
        widgetCount < _makeColorWidget.length;
        widgetCount++) {
      if (_makeColorWidget[widgetCount] == 'default') {
        Color targetColor = widget.colorData.color;
        var colorVal = targetColor.toString().substring(
            targetColor.toString().indexOf("(0") + 1,
            targetColor.toString().indexOf("(0") + 11);
        _detailData.add(
          Container(
            height: _deviceHeight * 0.05,
            width: _deviceWidth,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3),
            color: widget.colorData.color,
            child: SelectableText(
              widget.colorData.colorName.substring(7) + ' ' + colorVal,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"),
            ),
          ),
        );

        _decorationColor.add(widget.colorData.color);
      } else {
        Color targetColor =
            widget.colorData.color[_makeColorWidget[widgetCount]];
        var colorVal = targetColor.toString().substring(
            targetColor.toString().indexOf("(0") + 1,
            targetColor.toString().indexOf("(0") + 11);
        _detailData.add(
          Container(
            height: _deviceHeight * 0.05,
            width: _deviceWidth,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(3),
            color: widget.colorData.color[_makeColorWidget[widgetCount]],
            child: SelectableText(
              widget.colorData.colorName.substring(7) +
                  '[' +
                  _makeColorWidget[widgetCount].toString() +
                  '] ' +
                  colorVal,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"),
            ),
          ),
        );

        _decorationColor
            .add(widget.colorData.color[_makeColorWidget[widgetCount]]);
      }
    }

    _imageLogo.add(
      Container(
        width: _colorBarWidth,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: _decorationColor,
              ),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Color of detail'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: _deviceHeight * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _detailData,
            ),
          ),
          Container(
            height: _deviceHeight * 0.3,
            width: _deviceWidth,
            alignment: Alignment.centerLeft,
            child: Row(
              children: _imageLogo,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
