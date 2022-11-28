import 'package:json_annotation/json_annotation.dart';
import 'package:odindio/odin_reflect.dart';
part 'student_model.g.dart';

@odinReflectable
@JsonSerializable()
class StudentModel {
  StudentModel({
    this.id,
    this.stuName,
    this.age,
  });

  late int? id;
  late String? stuName;
  late int? age;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    id: json["id"],
    stuName: json["stuName"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stuName": stuName,
    "age": age,
  };
}
