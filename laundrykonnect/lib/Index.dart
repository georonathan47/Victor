// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:laundrykonnect/core/constants/colors.dart';
import 'package:laundrykonnect/src/features/History/presentation/pages/history.dart';

import 'src/features/Dashboard/presentation/pages/dashboardScreen.dart';
import 'src/features/Services/presentation/pages/services.dart';

class Index extends StatefulWidget {
  final String name;
  const Index({Key key, this.name}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      backgroundColor: BACKGROUND_COLOR,
      body: navigator(_selectedIndex),
    );
  }

  Widget navigator(int index) {
    if (index == 0) {
      return  DashboardScreen(name: widget.name);
    } else if (index == 1) {
      return const ServicesScreen();
    } else if (index == 2) {
      return const HistoryScreen();
      // } else if (index == 3) {
      //   return const LitigationScreen();
      // } else if (index == 4) {
      //   return const AccountScreen();
    // } else {
    //   return const DashboardScreen();
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: kPrimaryColor,
      selectedItemColor: kSecondColor,
      unselectedItemColor: Colors.white,
      selectedFontSize: 10,
      unselectedFontSize: 9,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard,
            size: 30,
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.article_outlined,
            size: 30,
          ),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history_outlined,
            size: 30,
          ),
          label: 'History',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     Icons.more_horiz_outlined,
        //     size: 30,
        //   ),
        //   label: 'MORE',
        // ),
      ],
    );
  }
}
