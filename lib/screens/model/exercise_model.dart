import 'dart:convert';
import 'dart:core';

class ExerciseModel {
  final String name;
  final String description;
  final String url;
  final String image;

  const ExerciseModel({
    required this.name,
    required this.description,
    required this.url,
    required this.image,
  });
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'Name': name});
    result.addAll({'Description': description});
    result.addAll({'Url': url});
    result.addAll({'img': image});

    return result;
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map['Name'] ?? '',
      description: map['Description'] ?? '',
      url: map['Url'] ?? '',
      image: map['img'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());
  factory ExerciseModel.fromJson(String source) =>
      ExerciseModel.fromMap(json.decode(source));
}
