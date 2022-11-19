import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatbook/config/pallette.dart';
import 'package:chatbook/data/data.dart';
import 'package:chatbook/models/story_model.dart';
import 'package:chatbook/models/user_model.dart';
import 'package:chatbook/widgets/profile_avatar.dart';
import 'package:chatbook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  Stories(this.currentUser, this.stories);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Responsive.isMobile(context) ? Colors.white : Colors.transparent,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: _StoryCard(story: story),
          );
        },
        itemCount: 1 + stories.length,
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;
  _StoryCard({this.isAddStory = false, this.currentUser, this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
              height: double.infinity,
              width: 110.0,
              fit: BoxFit.cover,
              imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: Responsive.isDesktop(context)
                ? const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4.0)
                  ]
                : null,
          ),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: isAddStory
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          size: 30.0,
                          color: Palette.facebookBlue,
                        ),
                        padding: EdgeInsets.zero),
                  )
                : ProfileAvatar(
                    imageUrl: story!.user.imageUrl,
                    hasBorder: !story!.isViewed,
                  )),
        Positioned(
            left: 8.0,
            bottom: 8.0,
            right: 8.0,
            child: Text(
              isAddStory ? "Add to Story" : story!.user.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
