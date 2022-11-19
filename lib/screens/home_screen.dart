import 'package:chatbook/config/pallette.dart';
import 'package:chatbook/data/data.dart';
import 'package:chatbook/models/post_model.dart';
import 'package:chatbook/models/story_model.dart';
import 'package:chatbook/widgets/circle_button.dart';
import 'package:chatbook/widgets/contact_list.dart';
import 'package:chatbook/widgets/more_options_list.dart';
import 'package:chatbook/widgets/responsive.dart';
import 'package:chatbook/widgets/room.dart';
import 'package:chatbook/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/create_post_container.dart';
import '../widgets/post_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _scrollController = TrackingScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(_scrollController),
          desktop: _HomeScreenDesktop(_scrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  _HomeScreenMobile(this.scrollController);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            "facebook",
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            circleButton(Icons.search, 30.0, () {
              print("search");
            }),
            circleButton(MdiIcons.facebookMessenger, 30.0, () {
              print("messsenger");
            }),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser, stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post);
          }, childCount: posts.length),
        )
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  _HomeScreenDesktop(this.scrollController);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: MoreOptionsList(currentUser),
              ),
            )),
        Spacer(),
        Container(
          width: 600,
          color: Colors.white,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser, stories),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return PostContainer(post);
                }, childCount: posts.length),
              )
            ],
          ),
        ),
        Spacer(),
        Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: ContactList(onlineUsers),
              ),
            )),
      ],
    );
  }
}
