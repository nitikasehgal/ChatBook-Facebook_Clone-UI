import 'package:chatbook/models/user_model.dart';
import 'package:chatbook/widgets/circle_button.dart';
import 'package:chatbook/widgets/custom_tab_bar.dart';
import 'package:chatbook/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/pallette.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icon;
  final int selectedindex;
  final Function(int) onTap;
  CustomAppBar({
    required this.currentUser,
    required this.icon,
    required this.selectedindex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4.0),
      ]),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: 600.0,
          child: CustomTabBar(
              icons: icon,
              index: selectedindex,
              onTap: onTap,
              isBottomIndicator: true),
        ),
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            UserCard(user: currentUser),
            SizedBox(
              width: 12.0,
            ),
            circleButton(Icons.search, 30.0, () {}),
            circleButton(MdiIcons.facebookMessenger, 30.0, () {})
          ]),
        )
      ]),
    );
  }
}
