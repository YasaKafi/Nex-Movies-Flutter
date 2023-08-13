import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_flutter_app/views/ExplorePage.dart';
import 'package:movies_flutter_app/views/FavoritePage.dart';
import 'package:movies_flutter_app/views/HomePage.dart';
import 'package:movies_flutter_app/views/ProfilePage.dart';
import '../controllers/navbar_controller.dart';


class BottomNavBar extends StatelessWidget {
  final BottomNavigationController controller = Get.put(BottomNavigationController());

  final List<Widget> pages = [
    HomePage(),
    const ExplorePage(),
    FavoritePage(),
    const ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: const Color(0xFFBA68C8),
          backgroundColor: Colors.black87,
          unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}


