import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/pages/join_now.dart';
import 'package:starbucks_app/pages/sign_in.dart';
import 'package:starbucks_app/pages/widgets/bottom_nav_bar.dart';
import 'package:starbucks_app/service/user_service.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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
              const SizedBox(height: 200),
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/ordertwocups.png', height: 80),
                    const SizedBox(height: 32),
                    const Text(
                      'Welcome to Starbucks® Rewards',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Say hello to easy ordering, tasty Rewards and get your favorites for free.',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
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
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JoinNowScreen()),
                        );
                        if (result == true) {
                          (context as Element).markNeedsBuild();
                        }
                      },
                      child: const Text('Join now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 64),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00704A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()),
                        );
                        if (result == 'join_now') {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JoinNowScreen()),
                          );
                        }
                      },
                      child: const Text('Sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Order'.tr, style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF00704A), // สีเขียว Starbucks
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _OrderMenuButton(
              icon: Icons.delivery_dining,
              title: 'Deliver'.tr,
              subtitle: 'Find your favorite Starbucks'.tr,
              onTap: () {
                Navigator.of(context).pushNamed('/address');
              },
            ),
            const SizedBox(height: 16),
            _OrderMenuButton(
              icon: Icons.store_mall_directory,
              title: 'In-store Pickup'.tr,
              subtitle: 'choose a Starbucks near you'.tr,
              onTap: () {
                Navigator.of(context).pushNamed('/stores');
              },
            ),
            const SizedBox(height: 16),
            _OrderMenuButton(
              icon: Icons.qr_code_scanner,
              title: 'Order to Table'.tr,
              subtitle: 'Scan Qr code at the table to order'.tr,
              onTap: () {
                Navigator.of(context).pushNamed('/scanqr');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomNavBar(), //อันนี้คือเพิ่ม Bottom Navigation Bar ถ้าอยากให้อยู่ในทุกๆหน้าก็ต้องเอาไว้ที่scaffold แบบนี้
    );
  }
}

class _OrderMenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _OrderMenuButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            children: [
              Icon(icon, size: 36, color: const Color(0xFF00704A)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
