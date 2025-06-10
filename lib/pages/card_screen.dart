import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/data/mock_user.dart';
import 'package:starbucks_app/models/user.dart';
import 'package:starbucks_app/pages/widgets/bottom_nav_bar.dart';
import 'package:starbucks_app/service/user_service.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Get.find<UserService>();

    // เช็คสถานะล็อกอินก่อน
    if (!userService.isLoggedIn) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1E3932),
          elevation: 0,
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Text(
                  '07:02',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.volume_off, color: Colors.white, size: 20),
                const Spacer(),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              userService.login(mockUser); // จำลองล็อกอิน
            },
            child: const Text('Sign in to view your account'),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      );
    }

    // ถ้าล็อกอินแล้ว
    final user = userService.currentUser.value!;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3932),
        elevation: 0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Text(
                '07:02',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.volume_off, color: Colors.white, size: 20),
              const Spacer(),
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ปุ่ม 4 อันด้านบน
          Container(
            color: const Color(0xFF1E3932),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _quickAction(Icons.credit_card, 'Add card'),
                _quickAction(Icons.add, 'Add money'),
                _quickAction(Icons.sync_alt, 'Transfer'),
                _quickAction(Icons.local_cafe, 'Pay in store'),
              ],
            ),
          ),
          // Card Balance
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CARD BALANCE',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '฿ ${user.balance.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFEAF6EF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 0),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Manage',
                        style: TextStyle(
                          color: Color(0xFF1E3932),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'As of 10 Jun 2025 07:02',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 16),
                // Card Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/menuNews_1.jpg', // เปลี่ยน path ตามไฟล์จริง
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '(4034)',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Column(
                    children: const [
                      Text(
                        'View all cards',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Benefit Section
          Container(
            margin: const EdgeInsets.only(top: 16),
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'YOUR BENEFIT(S)',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: const [
                      Icon(Icons.star, size: 48, color: Colors.black26),
                      SizedBox(height: 8),
                      Text(
                        'You have no Benefits available',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFF1E3932),
          radius: 28,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
