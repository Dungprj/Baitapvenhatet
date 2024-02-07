import 'dart:convert';

class Ward {
  String? name;
  String? level;
  String? id;
  String? districtId;
  String? provinceId;

  Ward({
    required this.name,
    required this.level,
    required this.id,
    required this.districtId,
    required this.provinceId,
  });

  Ward copyWith({
    String? name,
    String? level,
    String? id,
    String? districtId,
    String? provinceId,
  }) {
    return Ward(
      name: name ?? this.name,
      level: level ?? this.level,
      id: id ?? this.id,
      districtId: districtId ?? this.districtId,
      provinceId: provinceId ?? this.provinceId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'level': level,
      'id': id,
      'districtId': districtId,
      'provinceId': provinceId,
    };
  }

  factory Ward.fromMap(Map<String, dynamic> map) {
    if (map['name'] == null ||
        map['level'] == null ||
        map['id'] == null ||
        map['districtId'] == null ||
        map['provinceId'] == null) {
      throw ArgumentError(
          'Missing required fields when creating a Ward object from map.');
    }

    if (!(map['name'] is String) ||
        !(map['level'] is String) ||
        !(map['id'] is String) ||
        !(map['districtId'] is String) ||
        !(map['provinceId'] is String)) {
      throw ArgumentError(
          'Invalid data types when creating a Ward object from map.');
    }

    return Ward(
      name: map['name'] as String,
      level: map['level'] as String,
      id: map['id'] as String,
      districtId: map['districtId'] as String,
      provinceId: map['provinceId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ward.fromJson(String source) =>
      Ward.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Ward(name: $name, level: $level, id: $id, districtId: $districtId, provinceId: $provinceId)';
  }

  @override
  bool operator ==(covariant Ward other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.level == level &&
        other.id == id &&
        other.districtId == districtId &&
        other.provinceId == provinceId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        level.hashCode ^
        id.hashCode ^
        districtId.hashCode ^
        provinceId.hashCode;
  }
}
