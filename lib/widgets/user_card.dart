import 'package:chatbook/models/user_model.dart';
import 'package:chatbook/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserCard extends StatelessWidget {
  final User user;
  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          SizedBox(
            width: 6.0,
          ),
          Flexible(
            child: Text(
              user.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }
}
