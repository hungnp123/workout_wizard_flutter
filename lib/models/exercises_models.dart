import 'dart:convert';

class WorkoutModel {
  final String workout_name;

  final String workout_img;

  final String workout_gif;

  final int workout_reps;

  final String workout_des;

  final String workout_type;

  WorkoutModel({
    required this.workout_name,
    required this.workout_img,
    required this.workout_gif,
    required this.workout_reps,
    required this.workout_des,
    required this.workout_type,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'workout_name': workout_name});
    result.addAll({'workout_img': workout_img});
    result.addAll({'workout_gif': workout_gif});
    result.addAll({'workout_reps': workout_reps});
    result.addAll({'workout_des': workout_des});
    result.addAll({'workout_type': workout_type});
    return result;
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      workout_name: map['workout_name'] ?? '',
      workout_img: map['workout_img'] ?? '',
      workout_gif: map['workout_gif'] ?? '',
      workout_reps: map['workout_reps'] ?? '',
      workout_des: map['workout_des'] ?? '',
      workout_type: map['workout_type'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory WorkoutModel.fromJson(String source) =>
      WorkoutModel.fromMap(json.decode(source));
}