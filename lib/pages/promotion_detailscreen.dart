import 'package:flutter/material.dart';
import 'package:starbucks_app/pages/home_screen.dart';

class PromotionDetailScreen extends StatelessWidget {
  const PromotionDetailScreen({super.key, required this.promotion});
  final PromotionItem promotion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(promotion.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/menuNews_1.jpg'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (promotion.isNew)
                    Container(
                        // Badge NEW
                        ),
                  Text(
                    promotion.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(promotion.subtitle),
                  // เพิ่มรายละเอียดอื่นๆ ตามต้องการ
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
