import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:login/View/Home/HomePage.dart';

import '../../Constant/Constant.dart';
import '../Screen/Profile.dart';
import '../Screen/Setting.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: TabBarView(
              children: [
                HomePage(),
                Setting(),
                Setting(),
                Profile(),
              ],
            ),
            bottomNavigationBar: Container(
              height: screenHeight * 0.1,
              decoration: const BoxDecoration(color: kBackgroundColor),
              child: Container(
                width: screenWidth,
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.all(12),
                    indicatorColor: Colors.white,
                    isScrollable: true,
                    indicatorWeight: 3,
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                        child: Text(
                          "Notifactions",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.book,
                          color: Colors.black,
                        ),
                        child: Text(
                          "Booking",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        child: Text(
                          "Setting",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
