import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SliderComponent extends StatefulWidget {
  const SliderComponent({Key? key}) : super(key: key);

  @override
  _SliderComponentState createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.h,
      width: 100.0.w,
      color: Colors.black,
    );
  }
}
