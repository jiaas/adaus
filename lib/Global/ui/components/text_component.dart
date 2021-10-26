import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color_component.dart';

TextStyle? _customTextStyle(BuildContext context, String textStyle) {
  TextStyle? style;

  //1) Split the textStyle into type and color
  final List<String> styleProperties = textStyle.split('.');

  //2) Assign the value to variables
  final String type = styleProperties[0];
  final String color = styleProperties[1];

  //3) Evaluate the text type and color.
  //region Size and weight (T = Titles are bold. S = Subtitles aren't bold)
  switch (type) {
    case "t1":
      {
        style = Theme.of(context).textTheme.headline1!.copyWith(
              fontSize: 3.0.h,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF',
            );
      }
      break;

    case "t2":
      {
        style = Theme.of(context).textTheme.headline2!.copyWith(
              fontSize: 2.2.h,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF',
            );
      }
      break;

    case "s1":
      {
        style = Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontSize: 1.6.h, fontFamily: 'SF');
      }
      break;

    case "s2":
      {
        style = Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(fontSize: 1.3.h, fontFamily: 'SF');
      }
      break;

  }

  //endregion

  //region Color
  switch (color) {
    case "white":
      {
        style = style!.apply(color: white);
      }
      break;
    case "black":
      {
        style = style!.apply(color: black);
      }
      break;
    case "color":
      {
        style = style!.apply(color: Theme.of(context).primaryColor);
      }
      break;
  }
  //endregion

  return style;
}

Text customText(BuildContext context, String text, String textStyle) {
  return Text(
    text,
    style: _customTextStyle(
      context,
      textStyle,
    ),
  );
}
