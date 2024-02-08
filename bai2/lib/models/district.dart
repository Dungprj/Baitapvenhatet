// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class District {
  String? name;
  String? level;
  String? id;
  String? provinceId;

  District({
    required this.name,
    required this.level,
    required this.id,
    required this.provinceId,
  });

  District copyWith({
    String? name,
    String? level,
    String? id,
    String? provinceId,
  }) {
    return District(
      name: name ?? this.name,
      level: level ?? this.level,
      id: id ?? this.id,
      provinceId: provinceId ?? this.provinceId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'level': level,
      'id': id,
      'provinceId': provinceId,
    };
  }

  factory District.fromMap(Map<String, dynamic> map) {
    if (map['name'] == null ||
        map['level'] == null ||
        map['id'] == null ||
        map['provinceId'] == null) {
      throw ArgumentError(
        'Missing required fields when creating a District object from map.',
      );
    }

    if (!(map['name'] is String) ||
        !(map['level'] is String) ||
        !(map['id'] is String) ||
        !(map['provinceId'] is String)) {
      throw ArgumentError(
        'Invalid data types when creating a District object from map.',
      );
    }

    return District(
      name: map['name'] as String,
      level: map['level'] as String,
      id: map['id'] as String,
      provinceId: map['provinceId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory District.fromJson(String source) =>
      District.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'District(name: $name, level: $level, id: $id, provinceId: $provinceId)';
  }

  @override
  bool operator ==(covariant District other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.level == level &&
        other.id == id &&
        other.provinceId == provinceId;
  }

  @override
  int get hashCode {
    return name.hashCode ^ level.hashCode ^ id.hashCode ^ provinceId.hashCode;
  }
}
