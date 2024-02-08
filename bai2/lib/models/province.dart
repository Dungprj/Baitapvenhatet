import 'dart:convert';

class Province {
  String? name;
  String? level;
  String? id;

  Province({
    required this.name,
    required this.level,
    required this.id,
  });

  Province copyWith({
    String? name,
    String? level,
    String? id,
  }) {
    return Province(
      name: name ?? this.name,
      level: level ?? this.level,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'level': level,
      'id': id,
    };
  }

  factory Province.fromMap(Map<String, dynamic> map) {
    if (map['name'] == null || map['level'] == null || map['id'] == null) {
      throw ArgumentError(
          'Missing required fields when creating a Province object from map.');
    }

    if (!(map['name'] is String) ||
        !(map['level'] is String) ||
        !(map['id'] is String)) {
      throw ArgumentError(
          'Invalid data types when creating a Province object from map.');
    }

    return Province(
      name: map['name'] as String,
      level: map['level'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Province.fromJson(String source) =>
      Province.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Province(name: $name, level: $level, id: $id)';

  @override
  bool operator ==(covariant Province other) {
    if (identical(this, other)) return true;

    return other.name == name && other.level == level && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ level.hashCode ^ id.hashCode;
}
