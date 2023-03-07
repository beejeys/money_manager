
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../screen_home.dart';

class MoneyManagerBottomNavigation extends StatelessWidget {
  const MoneyManagerBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      builder: (BuildContext context, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          currentIndex:updatedIndex,
          onTap: (newIndex) {
            ScreenHome.selectedIndexNotifier.value = newIndex;
          },
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.home),label:'Home'),
            BottomNavigationBarItem(icon:Icon(Icons.category),label:'Category'),
          ]
        );
      }
    );
  }
}