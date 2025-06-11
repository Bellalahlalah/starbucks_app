import 'package:flutter/material.dart';
import 'package:starbucks_app/data/mock_address_service.dart';
import 'package:starbucks_app/pages/widgets/order_map_screen.dart';

class OrderAddressScreen extends StatelessWidget {
  const OrderAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = MockAddressService.getAddresses();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Search for location',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search box
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Enter a building or a street name',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'RECENT SEARCHES',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              itemCount: addresses.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final address = addresses[index];
                return ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.grey),
                  title: Text(
                    address.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(address.detail),
                  onTap: () {
                    // ไปหน้าแผนที่ พร้อมส่ง address ไป
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderMapScreen(address: address),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
