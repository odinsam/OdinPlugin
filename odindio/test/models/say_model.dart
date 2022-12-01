import 'package:json_annotation/json_annotation.dart';
import 'package:odindio/odin_reflect.dart';

part 'say_model.g.dart';

@odinReflectable
@JsonSerializable()
class SayModel {
  final String? statuss;
  final Data? data;
  final String? msg;

  SayModel({
    this.statuss,
    this.data,
    this.msg,
  });

  factory SayModel.fromJson(Map<String, dynamic> json) =>
      _$SayModelFromJson(json);

  Map<String, dynamic> toJson() => _$SayModelToJson(this);
}

@JsonSerializable()
class Data {
  final int? id;
  final String? content;
  final String? author;
  final String? origin;
  final String? link;
  @JsonKey(name: 'is_comment')
  final bool? isComment;
  final int? likes;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  Data({
    this.id,
    this.content,
    this.author,
    this.origin,
    this.link,
    this.isComment,
    this.likes,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
