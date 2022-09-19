import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_mert_album/ui/pages/home_page.dart';
import 'package:real_mert_album/ui/pages/profile.dart';

class BottomBarController extends GetxController {
  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  set currentIndex(int index) => _currentIndex.value = index;
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BottomBarController>(
      init: BottomBarController(),
      builder: (controller)=>
      Scaffold(
        body: IndexedStack(
          children: const [
            HomePage(),
            Profile(),
          ],
          index: controller.currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
          ],
          currentIndex: controller.currentIndex,
          onTap: (index){
            controller.currentIndex = index;
          },
        ),
      ),
    );
  }
}
