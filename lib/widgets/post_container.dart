import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatbook/config/pallette.dart';
import 'package:chatbook/models/post_model.dart';
import 'package:chatbook/widgets/profile_avatar.dart';
import 'package:chatbook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  PostContainer(this.post);
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
          vertical: 5.0, horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        // height: 100.0,
        color: Colors.white,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? SizedBox.shrink()
                      : SizedBox(
                          height: 6.0,
                        ),
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl!),
                  )
                : SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post),
            )
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  _PostHeader(this.post);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                  ),
                  Icon(
                    Icons.public,
                    size: 12.0,
                    color: Colors.grey[600],
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  _PostStats(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10.0,
              ),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                post.likes.toString(),
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '${post.shares} shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        Divider(),
        Material(
          color: Colors.white,
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        MdiIcons.thumbUpOutline,
                        size: 20.0,
                        color: Colors.grey[600],
                      ),
                      label: Text(
                        "Like",
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ),
                VerticalDivider(),
                Expanded(
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        MdiIcons.shareOutline,
                        color: Colors.grey[600],
                        size: 20.0,
                      ),
                      label: Text("Share",
                          style: TextStyle(color: Colors.grey[600]))),
                ),
                VerticalDivider(),
                Expanded(
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        MdiIcons.commentOutline,
                        size: 20.0,
                        color: Colors.grey[600],
                      ),
                      label: Text("Comment",
                          style: TextStyle(color: Colors.grey[600]))),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
