import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:todey/ui/create_new_task/create_task.dart';
import 'package:todey/ui/home/home.dart';
import 'package:todey/ui/settings/setings.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    //list of pages
    List<Widget> pages = [Home(), Create(), Settings()];
    //instance var to get responsiveness and theme
    var theme = Theme.of(context);
    //controller
    PageController _pageController = PageController(initialPage: 0);
    //to naviagte in bottom nav
    int selectedIndex = 0;
    void itemTapped(index) {
      setState(() {
        selectedIndex = index;
      });
    }

    //change view
    onChanged(int selectedIndex) {
      _pageController.jumpToPage(selectedIndex);
    }

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: itemTapped,
        children: pages,
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          onChanged(1);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        elevation: 0,
        onTap: onChanged,
        backgroundColor: theme.backgroundColor,
        selectedItemColor: theme.primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_sharp), label: ""),
          BottomNavigationBarItem(icon: Icon(AntDesign.setting), label: "")
        ],
      ),
    );
  }
}

/*
ConvexAppBar(
          curve: Curves.elasticInOut,
          elevation: 0,
          initialActiveIndex: selectedIndex,
          activeColor: Colors.white,
          style: TabStyle.custom,
          onTap: onChanged,
          backgroundColor: theme.backgroundColor,
          curveSize: 0.5,
          items: [
            TabItem(
                isIconBlend: true,
                icon: Icon(
                  AntDesign.home,
                )),
            TabItem(
                isIconBlend: true,
                icon: Icon(Icons.add_circle_outline_outlined)),
            TabItem(
                isIconBlend: true,
                icon: Icon(
                  AntDesign.setting,
                ))
          ],
        ),*/
