import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayInStoreScreen extends StatelessWidget {
  const PayInStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          padding: const EdgeInsets.only(top: 48),
          child: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: BackButton(
                color: Theme.of(context).textTheme.titleLarge?.color),
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Pay'.tr,
              style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge?.color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Card Image
            Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/snoopycard.png', // เปลี่ยนเป็น path ของคุณ
                  width: double.infinity,
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Card Number & Change
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '(4034)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Change'.tr,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Card Balance
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'CARD BALANCE'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '฿ 0.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).textTheme.titleLarge?.color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.refresh,
                          size: 18,
                          color: Theme.of(context).textTheme.bodySmall?.color),
                      const SizedBox(width: 4),
                      Text(
                        '04:49',
                        style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.titleLarge?.color),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'As of 23 Jun 2025 19:43'.tr,
                    style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).textTheme.titleLarge?.color),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // QR Code
            Center(
              child: Column(
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Image.asset(
                      'assets/images/qrcode.jpg', // เปลี่ยนเป็น path ของคุณ
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '6169468343364034',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1.2,
                      color: Theme.of(context).textTheme.titleLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Please tell a barista to redeem the reward',
                    style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).textTheme.titleLarge?.color),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Your Benefit(s)
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 243, 243, 243),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'YOUR BENEFIT(S)'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.black38),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Benefit Icon
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(31, 138, 138, 138),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Icon(Icons.star, size: 32, color: Colors.black38),
                      ],
                    ),
                  ),
                  const SizedBox(height: 128),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
