import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/pages/join_now.dart';
import 'package:starbucks_app/pages/widgets/bottom_nav_bar.dart';
import 'package:starbucks_app/service/user_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Greeting ตามช่วงเวลา
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  // Method สร้างปุ่มเมนู
  Widget _buildMenuButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Method สร้างเมนูวงกลม
  Widget _buildCircleMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // News & Promotions Section
  Widget _buildNewsPromotionSection() {
    final List<PromotionItem> promotions = [
      PromotionItem(
        id: '1',
        title: 'Tam Tanode Bliss',
        subtitle: 'THAILAND Exclusive',
        imagePath: 'assets/images/menuNews_1.jpg',
        isNew: true,
      ),
      PromotionItem(
        id: '2',
        title: 'Vacay Mode C',
        subtitle: 'Limited Edition',
        imagePath: 'assets/images/reward1.png',
        isNew: false,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Text(
            'NEWS & PROMOTION',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 350,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: promotions.length,
            itemBuilder: (context, index) {
              return _buildPromotionCard(promotions[index]);
            },
          ),
        ),
      ],
    );
  }

  // Promotion Card
  Widget _buildPromotionCard(PromotionItem item) {
    return GestureDetector(
      onTap: () {
        // นำทางไปหน้า Promotion Detail
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.isNew)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userService = Get.find<UserService>();
    final user = userService.currentUser.value;
    final isLoggedIn = user != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Align(
            alignment: Alignment.centerRight,
            child: Obx(() {
              final user = userService.currentUser.value;
              final isLoggedIn = user != null;
              return !isLoggedIn
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signin');
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            }),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
              child: Obx(() {
                final user = userService.currentUser.value;
                final isLoggedIn = user != null;
                return isLoggedIn
                    ? Text(
                        '${_getGreeting()},\n${user.name}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    : const Text(
                        "It's a great day for coffee",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
              }),
            ),
            // Find a store menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildMenuButton(
                    icon: Icons.location_on_outlined,
                    color: Colors.white,
                    text: "Find a store",
                    onPressed: () {
                      Navigator.pushNamed(context, 'address');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Divider(
              height: 12,
              color: Color.fromARGB(255, 247, 250, 252),
              thickness: 5,
            ),
            const SizedBox(height: 15),
            // 4 Circle Menus
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleMenuButton(
                  icon: Icons.credit_card,
                  label: 'Pay in\nstore',
                  onTap: () {},
                ),
                _buildCircleMenuButton(
                  icon: Icons.delivery_dining,
                  label: 'Delivery\n',
                  onTap: () {
                    Navigator.pushNamed(context, 'address');
                  },
                ),
                _buildCircleMenuButton(
                  icon: Icons.store,
                  label: 'In-store\nPickup',
                  onTap: () {
                    Navigator.pushNamed(context, 'stores');
                  },
                ),
                _buildCircleMenuButton(
                  icon: Icons.table_restaurant,
                  label: 'Order to\nTable',
                  onTap: () {
                    Navigator.pushNamed(context, 'scanqr');
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Green Tag Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF002F1F),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Getting started with Starbucks*",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 239, 238, 238),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Rewards is easy",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 228, 227, 227),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Say hello to easy ordering, collect Stars on everything you buy and get your favorites for free.",
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.4,
                            color: Color.fromARGB(255, 206, 204, 204),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 110,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const JoinNowScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Join Now",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Right - Image
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/reward.png',
                        fit: BoxFit.contain,
                        height: 120,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildNewsPromotionSection(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

// PromotionItem class
class PromotionItem {
  final String id;
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isNew;

  PromotionItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.isNew,
  });
}
