import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/pages/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

// Method of _buildMenuButton
  Widget _buildMenuButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
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

//---------------------------------
//Method สร้างเมนูวงกลม
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
              color: Colors.grey[200], // สีเทาอ่อน
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

//---------------------------------
//Method News &Promotions
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
      // เพิ่ม promotion อื่นๆ ตามต้องการ
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // หัวข้อ
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

        // Carousel
        SizedBox(
          height: 350, // กำหนดความสูงของ carousel
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: promotions.length,
            itemBuilder: (context, index) {
              return _buildPromotionCard(promotions[index]);
            },
          ),
        ),

        // ส่วนเมนูล่าง
        //_buildBottomNavigationBar(),
      ],
    );
  }

//build promotion card
  Widget _buildPromotionCard(PromotionItem item) {
    return GestureDetector(
      onTap: () {
        // นำทางไปหน้า Promotion Detail
        Navigator.defaultRouteName;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              // รูปภาพ Promotion
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),

              // ข้อความและ Badge
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
//--------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.white),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
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
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
              child: Text(
                "It's a great day for coffee",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            //สร้าง menu Findstore
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildMenuButton(
                      icon: Icons.location_on,
                      text: "Find a store",
                      onPressed: () {})
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 12,
              color: const Color.fromARGB(255, 247, 250, 252),
              thickness: 5,
            ),

            SizedBox(
              height: 15,
            ),

            // Row 2 (4 Menu)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleMenuButton(
                  icon: Icons.credit_card,
                  label: 'Pay in\nstore',
                  onTap: () =>
                      Text('Pay in store clicked'), //เดี๋ยวมาแก้ตรงนี้ด้วย
                ),
                _buildCircleMenuButton(
                  icon: Icons.delivery_dining,
                  label: 'Delivery',
                  onTap: () => Text('Delivery clicked'),
                ),
                _buildCircleMenuButton(
                  icon: Icons.store,
                  label: 'In-store\nPickup',
                  onTap: () => Text('In-store Pickup clicked'),
                ),
                _buildCircleMenuButton(
                  icon: Icons.table_restaurant,
                  label: 'Order to\nTable',
                  onTap: () => Text('Order to Table clicked'),
                ),
              ],
            ),

            SizedBox(
              height: 15,
            ),

            //Row ของ tagสีเขียว(ใช้ติดตามคะแนน)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF002F1F),
              ),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // จัดให้อยู่กึ่งกลาง
                children: [
                  // ฝั่งซ้าย
                  Expanded(
                    flex: 2, // ใช้พื้นที่ 2 ส่วนจาก 3
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Getting started with Starbucks*",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 239, 238, 238)),
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
                              color: Color.fromARGB(255, 206, 204, 204)),
                        ),
                        const SizedBox(height: 16),

                        // ปุ่ม Join Now ที่ปรับขนาดแล้ว
                        SizedBox(
                          width: 110, height: 40, // กำหนดความกว้างให้เล็กลง
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12), // ลด padding แนวตั้ง
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Join Now",
                              style: TextStyle(
                                fontSize: 16, // ลดขนาดฟอนต์
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ฝั่งขวา - รูปภาพ
                  Expanded(
                    flex: 1, // ใช้พื้นที่ 1 ส่วนจาก 3
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/reward.png', // เปลี่ยนเป็น path ของรูปคุณ
                        fit: BoxFit.contain,
                        height: 120, // กำหนดความสูงของรูป
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //ส่วนของNew&Promotion
            _buildNewsPromotionSection(),
          ],
          //Children
        ),
      ),
      bottomNavigationBar: const BottomNavBar(), // ใช้ Widget จากไฟล์แยก
    );
  }
}

//-------------PromotionItem---------------------

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
