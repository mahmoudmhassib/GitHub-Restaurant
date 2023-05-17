import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/pages/messeges.dart';
import 'package:restaurant/pages/notification.dart';
import 'package:restaurant/pages/profile.dart';

import 'Home.dart';
class TabScreens extends StatefulWidget {
  const TabScreens({Key? key}) : super(key: key);

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  List<IconData> iconList=[Icons.home,Icons.notifications_rounded,Icons.messenger,Icons.person_pin];
  var _currentTabIndex=0;
  void _onTap(int index) {
    setState((){
      _currentTabIndex = index;
    });
  }
  List<Map<String,dynamic>> tabpages=[
    {'page':const Home()},
    {'page':const Notifications()},
    {'page':const Messeges()},
    {'page':const Profile()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabpages[_currentTabIndex]['page'],
        floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.orange[300],
        child:const Icon(Icons.search),),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.orange: Colors.orange[100];
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: isActive?35:25,
                color: color,
              ),
              const SizedBox(height: 4),
            ],
          );
        },
       // backgroundColor: HexColor('#373A36'),
        activeIndex: _currentTabIndex,
       // splashColor: HexColor('#FFA400'),
       // notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: _onTap,
        //hideAnimationController: _hideBottomBarAnimationController,
        shadow:const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color:Colors.orangeAccent,
        ),
      ),
    );
  }
}
