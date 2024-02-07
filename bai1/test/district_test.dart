import 'package:bai1/models/district.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('District Tests', () {
    test('Create District object from map with missing data', () {
      final districtData = {"id": "001", "level": "Quận"};

      expect(() => District.fromMap(districtData), throwsArgumentError);
    });

    test('Create District object from map with all data', () {
      final districtData = {
        "id": "001",
        "name": "Quận Ba Đình",
        "level": "Thành phố",
        "provinceId": "02",
      };

      final district = District.fromMap(districtData);

      expect(district, isNotNull);
      expect(district.id, equals("001"));
      expect(district.name, equals("Quận Ba Đình"));
      expect(district.level, equals("Thành phố"));
      expect(district.provinceId, equals("02"));
    });

    test('Create District object with invalid data', () {
      final districtData = {
        "id": "001",
        "name": 123, // Invalid data type for name
        "level": "Thành phố",
        "provinceId": "02",
      };

      expect(() => District.fromMap(districtData), throwsArgumentError);
    });

    test('Check equality between District objects', () {
      final district1 = District(
        id: "001",
        name: "Quận Ba Đình",
        level: "Thành phố",
        provinceId: "02",
      );

      final district2 = District(
        id: "001",
        name: "Quận Ba Đình",
        level: "Thành phố",
        provinceId: "02",
      );

      final district3 = District(
        id: "002",
        name: "Quận Hoàn Kiếm",
        level: "Thành phố",
        provinceId: "02",
      );

      expect(district1, equals(district2));
      expect(district1, isNot(equals(district3)));
    });
  });
}
