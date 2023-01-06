// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: file_names
class CTA {
  final String name;
  final String description;

  CTA(
    this.name,
    this.description,
  );

  CTA copyWith({
    String? name,
    String? description,
  }) {
    return CTA(
      name ?? this.name,
      description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
    };
  }

  factory CTA.fromMap(Map<String, dynamic> map) {
    return CTA(
      map['name'] as String,
      map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CTA.fromJson(String source) =>
      CTA.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CTA(name: $name, description: $description)';

  @override
  bool operator ==(covariant CTA other) {
    if (identical(this, other)) return true;

    return other.name == name && other.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode;
}
