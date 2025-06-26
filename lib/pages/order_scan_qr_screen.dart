import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class OrderScanQRScreen extends StatefulWidget {
  const OrderScanQRScreen({super.key});

  @override
  State<OrderScanQRScreen> createState() => _OrderScanQRScreenState();
}

class _OrderScanQRScreenState extends State<OrderScanQRScreen> {
  String? qrText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //icon back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Order to Table'.tr,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00704A),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: MobileScanner(
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                if (barcodes.isNotEmpty && barcodes.first.rawValue != null) {
                  setState(() {
                    qrText = barcodes.first.rawValue;
                  });
                  // สามารถนำ qrText ไปใช้งานต่อได้
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                qrText != null ? 'QR Code: $qrText' : 'กรุณาสแกน QR ที่โต๊ะ',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
