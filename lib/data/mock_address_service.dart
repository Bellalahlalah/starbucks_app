class Address {
  final String name;
  final String detail;

  Address({required this.name, required this.detail});
}

class MockAddressService {
  static List<Address> getAddresses() {
    return [
      Address(name: 'บ้าน', detail: '123/45 ถนนสุขุมวิท, กรุงเทพฯ'),
      Address(name: 'ที่ทำงาน', detail: '88 อาคาร A ถนนสีลม, กรุงเทพฯ'),
      Address(name: 'คอนโด', detail: '55/12 คอนโด XYZ, เชียงใหม่'),
    ];
  }
}
