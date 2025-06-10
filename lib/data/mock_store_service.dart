class Store {
  final String name;
  final String address;
  final String distance;

  Store({required this.name, required this.address, required this.distance});
}

class MockStoreService {
  // จำลองข้อมูลร้าน
  static List<Store> getStores() {
    return [
      Store(
        name: 'Starbucks CentralWorld',
        address: 'ชั้น 1 CentralWorld, กรุงเทพฯ',
        distance: '0.5 km',
      ),
      Store(
        name: 'Starbucks Siam Paragon',
        address: 'ชั้น G Siam Paragon, กรุงเทพฯ',
        distance: '1.2 km',
      ),
      Store(
        name: 'Starbucks Terminal 21',
        address: 'ชั้น 2 Terminal 21, กรุงเทพฯ',
        distance: '2.0 km',
      ),
    ];
  }
}
