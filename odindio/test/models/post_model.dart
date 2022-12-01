import 'package:json_annotation/json_annotation.dart';
import 'package:odindio/odin_reflect.dart';
part 'post_model.g.dart';

@odinReflectable
@JsonSerializable()
class PostModel {
  final int? code;
  final String? message;
  final List<Data>? data;

  PostModel({
    this.code,
    this.message,
    this.data,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}

@JsonSerializable()
class Data {
  final int? id;
  final String? stuName;
  final int? age;

  Data({
    this.id,
    this.stuName,
    this.age,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
