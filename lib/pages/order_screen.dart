import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks_app/pages/widgets/bottom_nav_bar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
