import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnChangeStringInput = void Function(String);


class WidgetHelper{
  static Widget textFormField({
    Size size,
    TextEditingController controller,
    String label,
    double w,
    double h,
    int maxLength,
    bool numeric,
    int maxLines,
    bool enable,
    Color fillColor = Colors.white,
    List<TextInputFormatter> formatter = const [],
    OnChangeStringInput onChange,
    Color borderColor,
    Color placeHolderColor,
    double borderRadius = 10.0,
  }) {
    if (borderColor == null) {
      borderColor = Colors.grey.withOpacity(0.5);
    }
    if (borderColor == null) {
      placeHolderColor = Colors.black;
    }
    return Container(
      height: size.height * h,
      width: size.width * w,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        enabled: enable,
        maxLength: maxLength,
        textAlign: TextAlign.center,
        keyboardType: (numeric) ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        onChanged: onChange,
        controller: controller,
        inputFormatters: formatter,
        decoration: InputDecoration(
          counterText: "",
          fillColor: fillColor,
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(borderRadius),
            borderSide: new BorderSide(
              color: borderColor,
              width: 0.8,
            ),
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.orange),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide:
            BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.5),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.orange.shade700, fontSize: 16.0),
        ),
      ),
    );
  }


  static Widget sspRadioGroup({
    List<dynamic> title,
    List<dynamic> value,
    dynamic valueSelect,
    TextDirection direction = TextDirection.rtl,
    bool isVertical = false,
    callback,
  }) {
    List<Widget> containerList = List<Widget>();
    int index = 0;
    for (var i in title) {
      containerList.add(
        Row(
          children: [
            Radio(
              activeColor: Colors.orange,
              value: value[index],
              groupValue: valueSelect,
              onChanged: (vS) {
                int index = -1;
                var tS;
                var iS;
                for (var i in value) {
                  index++;
                  if (i == vS) {
                    tS = title[index];
                    iS = index;
                  }
                }
                callback(
                  vS,
                  tS,
                  iS,
                );
              },
            ),
            AutoSizeText(
              title[index],
              maxLines: 1,
              maxFontSize: 18.0,
              minFontSize: 10.0,
              style: TextStyle(
                fontSize: 14.0,
              ),
            )
          ],
        ),
      );
      index++;
    }

    var container;
    if (isVertical)
      container = Row(children: containerList);
    else
      container = Column(children: containerList);

    return Directionality(
      textDirection: direction,
      child: Container(
        child: container,
      ),
    );
  }
}