import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:park_here/screens/add_vehicle_screen.dart';
import 'package:park_here/screens/home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List selectedScreen = [
    const HomeScreen(),
    const AddVehicleScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: selectedScreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        // selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        // backgroundColor: Colors.white24,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.car_detailed,
                // color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.add,
                // color: Colors.white,
              ),
              label: "")
        ],
      ),
    );
  }
}
