import 'package:flutter/material.dart';
import 'package:laundrykonnect/core/constants/colors.dart';

import 'src/features/Dashboard/presentation/pages/dashboardScreen.dart';

class Index extends StatefulWidget {
  const Index({Key key}) : super(key: key);

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
      return const DashboardScreen();
      // } else if (index == 1) {
      //   return const ServicesScreen();
      // } else if (index == 2) {
      //   return const PaymentScreen(showButton: false);
      // } else if (index == 3) {
      //   return const LitigationScreen();
      // } else if (index == 4) {
      //   return const AccountScreen();
      } else {
      return null;
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
            Icons.payment_outlined,
            size: 30,
          ),
          label: 'Pay',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     Icons.account_balance_outlined,
        //     size: 30,
        //   ),
        //   label: 'Litigation',
        // ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.more_horiz_outlined,
            size: 30,
          ),
          label: 'MORE',
        ),
      ],
    );
  }
}
