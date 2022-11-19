import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class circleButton extends StatelessWidget {
  final IconData iconname;
  final double iconSize;
  final VoidCallback onpressed;
  circleButton(this.iconname, this.iconSize, this.onpressed);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
          onPressed: onpressed,
          icon: Icon(
            iconname,
            color: Colors.black,
            size: iconSize,
          )),
    );
  }
}
