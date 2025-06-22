import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.find();

    return Obx(
      () => Container(
        color: Colors.white,
        height: 90,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          selectedItemColor: Colors.green,
          unselectedItemColor: const Color.fromARGB(255, 136, 136, 136),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.home_outlined),
                  SizedBox(height: 1),
                  Text('Home', style: TextStyle(fontSize: 14)),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.home, color: Colors.green),
                  SizedBox(height: 1),
                  Text('Home',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.green)),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.credit_card_outlined),
                  SizedBox(height: 1),
                  Text('Card', style: TextStyle(fontSize: 14)),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.credit_card, color: Colors.green),
                  SizedBox(height: 1),
                  Text('Card',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.green)),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.local_cafe_outlined),
                  SizedBox(height: 1),
                  Text('Order', style: TextStyle(fontSize: 14)),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.local_cafe, color: Colors.green),
                  SizedBox(height: 1),
                  Text('Order',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.green)),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.mail_outline),
                  SizedBox(height: 1),
                  Text('Inbox', style: TextStyle(fontSize: 14)),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.mail, color: Colors.green),
                  SizedBox(height: 1),
                  Text('Inbox',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.green)),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.person_outline),
                  SizedBox(height: 1),
                  Text('Account', style: TextStyle(fontSize: 14)),
                ],
              ),
              activeIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.person, color: Colors.green),
                  SizedBox(height: 1),
                  Text('Account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.green)),
                ],
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
