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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            title: const SizedBox.shrink(),
          ),
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
                    Text(
                      'Welcome to Starbucks® Rewards'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Say hello to easy ordering, tasty Rewards and get your favorites for free.'
                          .tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
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
                      child: Text('Join now'.tr,
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
                      child: Text('Sign in'.tr,
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

    // ถ้า user login แล้ว ให้แสดงหน้าจอการสั่งซื้อ
    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // สีพื้นหลังอ่อน
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Order'.tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 24),
              child: Text(
                'Exclusive for Starbucks® Rewards members.'.tr,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
            ),
            _OrderMenuButton(
              icon: Icons.delivery_dining_outlined,
              title: 'Deliver'.tr,
              subtitle: 'Find your favorite Starbucks'.tr,
              onTap: () {
                Navigator.of(context).pushNamed('/address');
              },
            ),
            const SizedBox(height: 16),
            _OrderMenuButton(
              icon: Icons.store_mall_directory_outlined,
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
      ))),
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
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: [
                  //title and subtitle อยู่ทางซ้าย
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(subtitle,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey)),
                      ],
                    ), // icon หลัก (Deliver, Pickup, QR) อยู่ขวา
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.13),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      size: 28,
                      color: const Color(0xFF00704A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
