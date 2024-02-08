import 'package:bai1/models/UserInfo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserInfo Tests', () {
    test('Tạo UserInfo từ map với dữ liệu hợp lệ', () {
      final userInfoData = {
        "name": "Nguyen Van A",
        "email": "a@example.com",
        "phoneNumber": "123456789",
        "birthDate": 946684800000, // 2000-01-01
        "address": {
          "province": {"name": "Tỉnh A", "level": "Tỉnh", "id": "01"},
          "district": {"name": "Quận A", "level": "Quận", "id": "001"},
          "ward": {"name": "Phường A", "level": "Phường", "id": "00001"},
          "street": "Đường A",
        },
      };

      final userInfo = UserInfo.fromMap(userInfoData);

      expect(userInfo.name, equals("Nguyen Van A"));
      expect(userInfo.email, equals("a@example.com"));
      expect(userInfo.phoneNumber, equals("123456789"));
      expect(userInfo.birthDate, equals(DateTime.utc(2000, 1, 1)));
      expect(userInfo.address, isNotNull);
      expect(userInfo.address!.province, isNotNull);
      expect(userInfo.address!.province!.name, equals("Tỉnh A"));
      expect(userInfo.address!.province!.level, equals("Tỉnh"));
      expect(userInfo.address!.province!.id, equals("01"));
    });

    test('Tạo UserInfo từ map với dữ liệu không hợp lệ', () {
      final userInfoData = {
        // Dữ liệu thiếu thông tin email
        "name": "Nguyen Van A",
        "phoneNumber": "123456789",
        "birthDate": 946684800000, // 2000-01-01
        "address": {
          "province": {"name": "Tỉnh A", "level": "Tỉnh", "id": "01"},
          "district": {"name": "Quận A", "level": "Quận", "id": "001"},
          "ward": {"name": "Phường A", "level": "Phường", "id": "00001"},
          "street": "Đường A",
        },
      };

      expect(() => UserInfo.fromMap(userInfoData), throwsArgumentError);
    });

    test('Kiểm tra tính đúng đắn của thuộc tính "birthDate"', () {
      final userInfoData = {
        "name": "Nguyen Van A",
        "email": "a@example.com",
        "phoneNumber": "123456789",
        // Dữ liệu birthDate không phải là một số nguyên
        "birthDate": "invalid_date",
        "address": {
          "province": {"name": "Tỉnh A", "level": "Tỉnh", "id": "01"},
          "district": {"name": "Quận A", "level": "Quận", "id": "001"},
          "ward": {"name": "Phường A", "level": "Phường", "id": "00001"},
          "street": "Đường A",
        },
      };

      expect(() => UserInfo.fromMap(userInfoData), throwsArgumentError);
    });

    // Thêm các test case cho các thuộc tính khác của UserInfo và xử lý trường hợp không hợp lệ.
  });
}
