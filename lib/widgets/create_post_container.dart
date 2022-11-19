import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatbook/models/user_model.dart';
import 'package:chatbook/widgets/profile_avatar.dart';
import 'package:chatbook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreatePostContainer extends StatelessWidget {
  final User current;
  CreatePostContainer(this.current);

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
        padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: current.imageUrl),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind?"),
                )),
              ],
            ),
            Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text(
                        "Live",
                        style: TextStyle(color: Colors.black),
                      )),
                  VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label:
                          Text("Photo", style: TextStyle(color: Colors.black))),
                  VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      ),
                      label:
                          Text("Room", style: TextStyle(color: Colors.black))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
