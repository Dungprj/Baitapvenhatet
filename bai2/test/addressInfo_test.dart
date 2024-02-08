import 'package:bai1/models/AddressInfo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddressInfo Tests', () {
    test('Tạo AddressInfo từ map với dữ liệu hợp lệ', () {
      final addressInfoData = {
        "province": {"name": "Tỉnh A", "level": "Tỉnh", "id": "01"},
        "district": {"name": "Quận A", "level": "Quận", "id": "001"},
        "ward": {"name": "Phường A", "level": "Phường", "id": "00001"},
        "street": "Đường A",
      };

      final addressInfo = AddressInfo.fromMap(addressInfoData);

      expect(addressInfo.province, isNotNull);
      expect(addressInfo.province!.name, equals("Tỉnh A"));
      expect(addressInfo.province!.level, equals("Tỉnh"));
      expect(addressInfo.province!.id, equals("01"));

      expect(addressInfo.district, isNotNull);
      expect(addressInfo.district!.name, equals("Quận A"));
      expect(addressInfo.district!.level, equals("Quận"));
      expect(addressInfo.district!.id, equals("001"));

      expect(addressInfo.ward, isNotNull);
      expect(addressInfo.ward!.name, equals("Phường A"));
      expect(addressInfo.ward!.level, equals("Phường"));
      expect(addressInfo.ward!.id, equals("00001"));

      expect(addressInfo.street, equals("Đường A"));
    });

    test('Tạo AddressInfo từ map với dữ liệu không hợp lệ', () {
      final addressInfoData = {
        // Dữ liệu thiếu thông tin quận
        "province": {"name": "Tỉnh A", "level": "Tỉnh", "id": "01"},
        "ward": {"name": "Phường A", "level": "Phường", "id": "00001"},
        "street": "Đường A",
      };

      expect(() => AddressInfo.fromMap(addressInfoData), throwsArgumentError);
    });

    test('Kiểm tra tính đúng đắn của thuộc tính "province"', () {
      final addressInfoData = {
        "province": {"name": "Tỉnh A", "level": "Tỉnh", "id": "01"},
        "district": {"name": "Quận A", "level": "Quận", "id": "001"},
        "ward": {"name": "Phường A", "level": "Phường", "id": "00001"},
        "street": "Đường A",
      };

      final addressInfo = AddressInfo.fromMap(addressInfoData);

      expect(addressInfo.province, isNotNull);
      expect(addressInfo.province!.name, equals("Tỉnh A"));
      expect(addressInfo.province!.level, equals("Tỉnh"));
      expect(addressInfo.province!.id, equals("01"));
    });

    test(
        'Kiểm tra tính đúng đắn của thuộc tính "ward" với dữ liệu không hợp lệ',
        () {
      final addressInfoData = {
        "province": {"name": "Tỉnh A", "level": "Tỉnh", "id": "01"},
        "district": {"name": "Quận A", "level": "Quận", "id": "001"},
        // Dữ liệu thiếu thông tin phường
        "street": "Đường A",
      };

      expect(() => AddressInfo.fromMap(addressInfoData), throwsArgumentError);
    });

    // Thêm các test case cho các thuộc tính khác của AddressInfo và xử lý trường hợp không hợp lệ.
  });
}
