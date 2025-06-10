import 'package:flutter/material.dart';
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
      image: 'assets/images/menuNews_1.jpg',
      title: 'Enjoy Starbucks beverages – only 140 Baht!',
      date: '09 Jun 2025',
      read: false,
    ),
    InboxItem(
      image: 'assets/images/menuNews_1.jpg',
      title: 'Refresh Alert',
      date: '04 Jun 2025',
      read: false,
    ),
    InboxItem(
      image: 'assets/images/menuNews_1.jpg',
      title: 'Earn Double Stars',
      date: '04 Jun 2025',
      read: false,
    ),
    InboxItem(
      image: 'assets/images/menuNews_1.jpg',
      title: 'Earn 7 Bonus Stars',
      date: '26 May 2025',
      read: false,
    ),
    InboxItem(
      image: 'assets/images/menuNews_1.jpg',
      title: 'Happy Specials! Only 125 Baht',
      date: '19 May 2025',
      read: false,
    ),
    InboxItem(
      image: 'assets/images/menuNews_1.jpg',
      title: 'Get 1 Bonus Star',
      date: '15 May 2025',
      read: false,
    ),
    InboxItem(
      image: 'assets/images/menuNews_1.jpg',
      title: 'Earn Double Stars',
      date: '28 Apr 2025',
      read: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 0),
            child: Row(
              children: [
                const Text(
                  'Inbox',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Color(0xFF00704A),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
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
            color: item.read ? Colors.white : const Color(0xFFEAF6EF),
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
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.date,
                            style: const TextStyle(
                              color: Colors.grey,
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
