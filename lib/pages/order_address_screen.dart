import 'package:flutter/material.dart';
import 'package:starbucks_app/data/mock_address_service.dart';

class OrderAddressScreen extends StatelessWidget {
  const OrderAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addresses = MockAddressService.getAddresses();

    return Scaffold(
      appBar: AppBar(
        //icon back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'เลือกที่อยู่จัดส่ง',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00704A),
      ),
      body: ListView.separated(
        itemCount: addresses.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final address = addresses[index];
          return ListTile(
            leading: const Icon(Icons.location_on, color: Color(0xFF00704A)),
            title: Text(address.name),
            subtitle: Text(address.detail),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('เลือกที่อยู่: ${address.name}')),
              );
            },
          );
        },
      ),
    );
  }
}
