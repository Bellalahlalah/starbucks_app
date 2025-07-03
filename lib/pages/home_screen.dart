import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:starbucks_app/pages/join_now.dart';
import 'package:starbucks_app/pages/pay_in_store_screen.dart';
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
      child: Row(
        children: [
          Icon(icon, size: 22, color: color.withOpacity(0.4)),
          const SizedBox(width: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
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
    // ignore: unused_element
    Color? textColor,
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
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // News & Promotions Section
  Widget _buildNewsPromotionSection(context) {
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Text(
            'NEWS & PROMOTION'.tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
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

  // Reward Carousel with Progress Bar
  Widget _buildRewardCarousel(BuildContext context) {
    final List<_RewardMilestone> _milestones = [
      _RewardMilestone(
        point: 20,
        title: 'A Free Upsize on Your Drink',
        description:
            'Get a free upsize on your favorite drink (Tall/Grande size).',
        imagePath: 'assets/images/ordertwocups.png',
      ),
      _RewardMilestone(
        point: 60,
        title: '25% Off on Food/Drink',
        description:
            'Get 25% off on a regular-priced handcrafted drink or food item.',
        imagePath: 'assets/images/ordertwocups.png',
      ),
      _RewardMilestone(
        point: 120,
        title: '50% Off on Your Purchase',
        description: 'Get 50% off up to 600 Baht/bill.',
        imagePath: 'assets/images/ordertwocups.png',
      ),
      _RewardMilestone(
        point: 160,
        title: '4 Free Drinks on Us',
        description:
            'Get 4 free handcrafted drinks with 2 customizations per drink/bill.',
        imagePath: 'assets/images/ordertwocups.png',
      ),
      _RewardMilestone(
        point: 350,
        title: 'Special Reward',
        description: 'Enjoy a special reward at 350 stars!',
        imagePath: 'assets/images/ordertwocups.png',
      ),
    ];

    final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, index, _) {
        final item = _milestones[index];
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF174C3A),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Left: Text
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Green 0★',
                              style: const TextStyle(
                                color: Color(0xFFB6FFB0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Stars earned to redeem rewards',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),

                            //milestone display
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(_milestones.length, (i) {
                                final isActive = i == index;
                                return GestureDetector(
                                  onTap: () => selectedIndex.value = i,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: isActive ? 32 : 24,
                                    height: isActive ? 32 : 24,
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isActive
                                            ? Colors.green
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      _milestones[i].point.toString(),
                                      style: TextStyle(
                                        color: isActive
                                            ? Colors.green
                                            : Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isActive ? 12 : 10,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Earn ${item.point} ★ to unlock the reward',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Right: Image
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          item.imagePath,
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Milestone Row
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userService = Get.find<UserService>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: 85,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 32),
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
                        child: Text(
                          'Sign in'.tr,
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
      body: Obx(() {
        final user = userService.currentUser.value;
        final isLoggedIn = user != null;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                child: isLoggedIn
                    ? Text(
                        '${_getGreeting()},\n${user.name}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge?.color,
                        ),
                      )
                    : Text(
                        "It's a great day for coffee".tr,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge?.color,
                        ),
                      ),
              ),
              // Find a store menu
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent, // ไม่มีพื้นหลัง
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
                      icon:
                          Icon(Icons.location_on_outlined, color: Colors.grey),
                      label: Text(
                        "Find a store".tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.color // เปลี่ยนสีตามต้องการ
                            ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'address');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Divider(
                height: 2,
                color: const Color.fromARGB(255, 225, 224, 224),
                thickness: 4,
              ),
              const SizedBox(height: 15),
              // 4 Circle Menus
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCircleMenuButton(
                    icon: Icons.credit_card,
                    label: 'Pay in\nstore'.tr,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PayInStoreScreen()));
                    },
                    textColor: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                  _buildCircleMenuButton(
                    icon: Icons.delivery_dining,
                    label: 'Delivery\n'.tr,
                    onTap: () {
                      Navigator.pushNamed(context, 'address');
                    },
                    textColor: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                  _buildCircleMenuButton(
                    icon: Icons.store,
                    label: 'In-store\nPickup'.tr,
                    onTap: () {
                      Navigator.pushNamed(context, 'stores');
                    },
                    textColor: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                  _buildCircleMenuButton(
                    icon: Icons.table_restaurant,
                    label: 'Order to\nTable'.tr,
                    onTap: () {
                      Navigator.pushNamed(context, 'scanqr');
                    },
                    textColor: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // Green Tag Section หรือ Carousel
              if (!isLoggedIn) ...[
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
                            Text(
                              "Getting started with Starbucks".tr,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 239, 238, 238),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Rewards is easy".tr,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 228, 227, 227),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Say hello to easy ordering, collect Stars on everything you buy and get your favorites for free."
                                  .tr,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const JoinNowScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Join Now".tr,
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
              ] else ...[
                _buildRewardCarousel(context),
                const SizedBox(height: 15),
              ],
              _buildNewsPromotionSection(context),
            ],
          ),
        );
      }),
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

//Class for Green Status Items
class GreenStatusItem {
  final String title;
  final String subtitle;
  final String? description;
  final String? imagePath;

  GreenStatusItem({
    required this.title,
    required this.subtitle,
    this.description,
    this.imagePath,
  });
}

class _RewardMilestone {
  final int point;
  final String title;
  final String description;
  final String imagePath;

  _RewardMilestone({
    required this.point,
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

// Custom Progress Bar Widget
class _RewardProgressBar extends StatelessWidget {
  final List<int> milestones;
  final int currentIndex;

  const _RewardProgressBar({
    required this.milestones,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // Main line
          Positioned.fill(
            top: 64,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              height: 1,
              color: const Color.fromARGB(255, 226, 226, 226).withOpacity(0.25),
            ),
          ),
          // Milestone dots
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(milestones.length, (i) {
                final isActive = i == currentIndex;
                return Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: isActive ? 24 : 16,
                      height: isActive ? 24 : 16,
                      decoration: BoxDecoration(
                        color: isActive
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isActive ? Colors.green : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          milestones[i].toString(),
                          style: TextStyle(
                            color: isActive ? Colors.green : Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: isActive ? 13 : 11,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
