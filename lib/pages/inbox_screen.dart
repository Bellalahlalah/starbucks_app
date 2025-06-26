import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/pages/widgets/bottom_nav_bar.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  // Mock data
  final List<InboxItem> items = [
    InboxItem(
      image: 'assets/images/circlemenuinbox.png',
      title: 'Enjoy Starbucks beverages – only 140 Baht!'.tr,
      date: '09 Jun 2025'.tr,
      read: false,
    ),
    InboxItem(
      image: 'assets/images/menuNews_1.jpg',
      title: 'Refresh Alert'.tr,
      date: '04 Jun 2025'.tr,
      read: false,
    ),
    InboxItem(
      image: 'assets/images/circlemenuinbox.png',
      title: 'Earn Double Stars'.tr,
      date: '04 Jun 2025'.tr,
      read: false,
    ),
    InboxItem(
      image: 'assets/images/menuNews_1.jpg',
      title: 'Earn 7 Bonus Stars'.tr,
      date: '26 May 2025'.tr,
      read: false,
    ),
    InboxItem(
      image: 'assets/images/circlemenuinbox.png',
      title: 'Happy Specials! Only 125 Baht'.tr,
      date: '19 May 2025'.tr,
      read: false,
    ),
    InboxItem(
      image: 'assets/images/menuNews_1.jpg',
      title: 'Get 1 Bonus Star'.tr,
      date: '15 May 2025'.tr,
      read: false,
    ),
    InboxItem(
      image: 'assets/images/circlemenuinbox.png',
      title: 'Earn Double Stars'.tr,
      date: '28 Apr 2025'.tr,
      read: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                Row(
                  children: [
                    Text(
                      'Inbox'.tr,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Edit'.tr,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(
          color: Color(0xFFE0E0E0),
          height: 1,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Material(
            color: item.read
                ? Theme.of(context).scaffoldBackgroundColor
                : const Color(0xFFEAF6EF),
            child: InkWell(
              onTap: () {
                setState(() {
                  items[index] = item.copyWith(read: true);
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // รูป
                    ClipOval(
                      child: Image.asset(
                        item.image,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // ข้อความ
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.date,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // จุดเขียวถ้ายังไม่ได้อ่าน
                    if (!item.read)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFF00704A),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class InboxItem {
  final String image;
  final String title;
  final String date;
  final bool read;

  InboxItem({
    required this.image,
    required this.title,
    required this.date,
    required this.read,
  });

  InboxItem copyWith({bool? read}) {
    return InboxItem(
      image: image,
      title: title,
      date: date,
      read: read ?? this.read,
    );
  }
}
