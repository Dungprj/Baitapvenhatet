import 'package:bai1/models/province.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Province Tests', () {
    test('Create Province object from map with missing data', () {
      final provinceData = {"id": "01", "level": "Thành phố Trung ương"};

      expect(() => Province.fromMap(provinceData), throwsArgumentError);
    });

    test('Create Province object from map with all data', () {
      final provinceData = {
        "id": "01",
        "name": "Thành Phố Hà Nội",
        "level": "Thành phố Trung ương",
      };

      final province = Province.fromMap(provinceData);

      expect(province, isNotNull);
      expect(province.id, equals("01"));
      expect(province.name, equals("Thành Phố Hà Nội"));
      expect(province.level, equals("Thành phố Trung ương"));
    });

    test('Create Province object with invalid data', () {
      final provinceData = {
        "id": "01",
        "name": 123, // Invalid data type for name
        "level": "Thành phố Trung ương",
      };

      expect(() => Province.fromMap(provinceData), throwsArgumentError);
    });
  });
}
