import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import 'create_rhapsave/screen.dart';
import 'profile/screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 3;

  final items = const [
    BottomBarItem(Icons.home_outlined, 'Home'),
    BottomBarItem(Icons.wallet_outlined, 'Payment'),
    BottomBarItem(Icons.wallet_outlined, 'Create Rhapsave'),
    BottomBarItem(Icons.person_outlined, 'Profile'),
  ];
  final pages = const [
    SizedBox(),
    SizedBox(),
    CreateRhapsaveScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomBar(
        icons: items,
        selectedIndex: _selectedIndex,
        onClick: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    setState(() => _selectedIndex = index);
  }
}
