import 'package:bai1/models/ward.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Ward Tests', () {
    test('Create Ward object from map with missing data', () {
      final wardData = {"id": "00001", "level": "Phường"};

      expect(() => Ward.fromMap(wardData), throwsArgumentError);
    });

    test('Create Ward object from map with all data', () {
      final wardData = {
        "id": "00001",
        "name": "Phường Phúc Xá",
        "level": "Phường",
        "districtId": "001",
        "provinceId": "01",
      };

      final ward = Ward.fromMap(wardData);

      expect(ward, isNotNull);
      expect(ward.id, equals("00001"));
      expect(ward.name, equals("Phường Phúc Xá"));
      expect(ward.level, equals("Phường"));
      expect(ward.districtId, equals("001"));
      expect(ward.provinceId, equals("01"));
    });

    test('Create Ward object with invalid data', () {
      final wardData = {
        "id": "00001",
        "name": 123, // Invalid data type for name
        "level": "Phường",
        "districtId": "001",
        "provinceId": "01",
      };

      expect(() => Ward.fromMap(wardData), throwsArgumentError);
    });

    test('Check equality between Ward objects', () {
      final ward1 = Ward(
        id: "00001",
        name: "Phường Phúc Xá",
        level: "Phường",
        districtId: "001",
        provinceId: "01",
      );

      final ward2 = Ward(
        id: "00001",
        name: "Phường Phúc Xá",
        level: "Phường",
        districtId: "001",
        provinceId: "01",
      );

      final ward3 = Ward(
        id: "00002",
        name: "Phường Quang Trung",
        level: "Phường",
        districtId: "002",
        provinceId: "01",
      );

      expect(ward1, equals(ward2));
      expect(ward1, isNot(equals(ward3)));
    });

    test('Check hashCode consistency', () {
      final ward1 = Ward(
        id: "00001",
        name: "Phường Phúc Xá",
        level: "Phường",
        districtId: "001",
        provinceId: "01",
      );

      final ward2 = Ward(
        id: "00001",
        name: "Phường Phúc Xá",
        level: "Phường",
        districtId: "001",
        provinceId: "01",
      );

      expect(ward1.hashCode, equals(ward2.hashCode));
    });
  });
}
