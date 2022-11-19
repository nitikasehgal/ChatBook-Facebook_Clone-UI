import 'package:chatbook/data/data.dart';
import 'package:chatbook/screens/home_screen.dart';
import 'package:chatbook/widgets/custom_tab_bar.dart';
import 'package:chatbook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/custom_appbar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];

  int _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
            appBar: Responsive.isDesktop(context)
                ? PreferredSize(
                    child: CustomAppBar(
                        currentUser: currentUser,
                        icon: _icons,
                        selectedindex: _selectedindex,
                        onTap: (index) {
                          setState(() {
                            _selectedindex = index;
                          });
                        }),
                    preferredSize: Size(screensize.width, 100.0))
                : null,
            body: IndexedStack(
              index: _selectedindex,
              children: _screens,
            ),
            bottomNavigationBar: !Responsive.isDesktop(context)
                ? Container(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: CustomTabBar(
                        icons: _icons,
                        index: _selectedindex,
                        onTap: (index) {
                          setState(() {
                            _selectedindex = index;
                          });
                        }),
                  )
                : SizedBox.shrink()));
  }
}
