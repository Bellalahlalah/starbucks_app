import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:starbucks_app/data/mock_store_service.dart';
import 'package:starbucks_app/pages/widgets/order_map_screen.dart';

class StoreListScreen extends StatefulWidget {
  const StoreListScreen({super.key});

  @override
  State<StoreListScreen> createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(13.7563, 100.5018); // Bangkok

  @override
  Widget build(BuildContext context) {
    final stores = MockStoreService.getStores();

    return Scaffold(
      appBar: AppBar(
        //icon back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // title
        title: Text(
          'Select a Store'.tr,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00704A),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 13.0,
              ),
              markers: stores.map((store) {
                // สมมติ mock lat/lng
                return Marker(
                  markerId: MarkerId(store.name),
                  position: LatLng(13.75 + stores.indexOf(store) * 0.01,
                      100.50 + stores.indexOf(store) * 0.01),
                  infoWindow:
                      InfoWindow(title: store.name, snippet: store.address),
                );
              }).toSet(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nearby Stores'.tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: stores.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final store = stores[index];
                return ListTile(
                  leading: const Icon(Icons.store, color: Color(0xFF00704A)),
                  title: Text(store.name),
                  subtitle: Text('${store.address}\n${store.distance}'),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderMapScreen(
                          address: store, // ส่ง store ไปในพารามิเตอร์ address
                        ),
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
