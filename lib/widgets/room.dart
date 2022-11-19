import 'package:chatbook/config/pallette.dart';
import 'package:chatbook/models/user_model.dart';
import 'package:chatbook/widgets/profile_avatar.dart';
import 'package:chatbook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  Rooms(this.onlineUsers);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
          itemCount: 1 + onlineUsers.length,
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(children: [
        ShaderMask(
          shaderCallback: (rect) =>
              Palette.createRoomGradient.createShader(rect),
          child: Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 4.0,
        ),
        Text('Create\nRoom'),
      ]),
      onPressed: () {
        "Create Rooms";
      },
      style: OutlinedButton.styleFrom(
          textStyle: TextStyle(color: Palette.facebookBlue),
          // backgroundColor: Colors.white,
          side: BorderSide(color: Colors.blueAccent, width: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
    );
  }
}
