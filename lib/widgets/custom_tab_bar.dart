import 'package:chatbook/config/pallette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int index;
  final Function(int) onTap;
  final bool isBottomIndicator;
  CustomTabBar(
      {required this.icons,
      required this.index,
      required this.onTap,
      this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: isBottomIndicator
              ? Border(
                  bottom: BorderSide(color: Palette.facebookBlue, width: 3.0))
              : Border(
                  top: BorderSide(color: Palette.facebookBlue, width: 3.0))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    size: 30.0,
                    color: i == index ? Palette.facebookBlue : Colors.black45,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
