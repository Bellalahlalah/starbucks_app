class Address {
  final String name;
  final String detail;
  final double lat;
  final double lng;

  Address(
      {required this.name,
      required this.detail,
      required this.lat,
      required this.lng});
}

class MockAddressService {
  static List<Address> getAddresses() => [
        Address(
          name: 'เทศบาลนครระยอง',
          detail: 'Mueang Rayong District, Rayong',
          lat: 12.6814,
          lng: 101.2777,
        ),
        Address(
          name: 'IRPC Public Company Limited',
          detail: 'Mueang Rayong District, Rayong',
          lat: 12.6625018,
          lng: 101.3082660,
        ),
        Address(
          name: 'Starbucks Coffee',
          detail: 'Passion Shopping Mall, Rayong',
          lat: 12.6832267,
          lng: 101.2486582,
        ),
        Address(
          name: 'Starbucks Central World',
          detail: '2nd floor, BKK',
          lat: 13.7447428,
          lng: 100.5401896,
        ),
        Address(
          name: 'Starbucks Siam Paragon',
          detail: 'first floor, BKK',
          lat: 13.7456498,
          lng: 100.5345392,
        ),
        Address(
          name: 'Starbucks Terminal21',
          detail: 'first floor, BKK',
          lat: 13.7374590,
          lng: 100.5601704,
        ),
        // เพิ่ม mock address อื่นๆ ได้
      ];
}
