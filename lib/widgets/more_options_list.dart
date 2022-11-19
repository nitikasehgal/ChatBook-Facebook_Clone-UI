import 'package:chatbook/config/pallette.dart';
import 'package:chatbook/models/user_model.dart';
import 'package:chatbook/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> icons = [
    [MdiIcons.shieldAccount, Colors.deepPurple, 'COVID-19 Info Center'],
    [MdiIcons.accountMultiple, Colors.cyan, 'Friends'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Pages'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Events'],
  ];
  final User currentUser;
  MoreOptionsList(this.currentUser);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: UserCard(user: currentUser));
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      icons[index - 1][0],
                      size: 30.0,
                      color: icons[index - 1][1],
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Flexible(
                        child: Text(
                      icons[index - 1][2],
                      style: TextStyle(
                          fontSize: 16.0, overflow: TextOverflow.ellipsis),
                    ))
                  ],
                ),
              ),
            );
          }
        },
        itemCount: 1 + icons.length,
      ),
    );
  }
}
