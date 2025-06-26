import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/pages/join_now.dart';
import 'package:starbucks_app/pages/sign_in.dart';
import 'package:starbucks_app/pages/widgets/bottom_nav_bar.dart';
import 'package:starbucks_app/service/user_service.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Get.find<UserService>();
    final isLoggedIn = userService.isLoggedIn;

    if (!isLoggedIn) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const SizedBox.shrink(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome to Starbucks® Rewards'.tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Enjoy a cashless and convenient experience in-store and easy ordering via Starbucks® TH App. Simply join Starbucks® Rewards and unlock access to exclusive perks.'
                          .tr,
                      style: TextStyle(fontSize: 13, color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 32),
                    Image.asset('assets/images/starbucks_welcome.png',
                        height: 100),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF00704A),
                        backgroundColor: const Color(0xFFF2FBF6),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                        );
                        if (result == true) {
                          (context as Element).markNeedsBuild();
                        }
                      },
                      child: Text('Sign in'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00704A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JoinNowScreen()),
                        );
                        if (result == 'sign_in') {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                          );
                        }
                      },
                      child: Text('Join now'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
            ],
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
              const Text(
                '07:02',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.volume_off, color: Colors.white, size: 20),
              const Spacer(),
              const CircleAvatar(
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
                Text(
                  'CARD BALANCE'.tr,
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
                      child: Text(
                        'Manage'.tr,
                        style: TextStyle(
                          color: Color(0xFF1E3932),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'As of 10 Jun 2025 07:02'.tr,
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
                    'assets/images/snoopycard.png',
                    height: 200,
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
                    children: [
                      Text(
                        'View all cards'.tr,
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
                Text(
                  'YOUR BENEFIT(S)'.tr,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      Icon(Icons.star, size: 48, color: Colors.black26),
                      SizedBox(height: 8),
                      Text(
                        'You have no Benefits available'.tr,
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
