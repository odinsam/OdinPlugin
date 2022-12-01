import 'package:json_annotation/json_annotation.dart';
import 'package:odindio/odin_reflect.dart';

part 'ten_model.g.dart';

@odinReflectable
@JsonSerializable()
class TenModel {
  final int? code;
  final String? imgurl;
  final String? name;
  final String? mail;

  TenModel({
    this.code,
    this.imgurl,
    this.name,
    this.mail,
  });

  factory TenModel.fromJson(Map<String, dynamic> json) =>
      _$TenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TenModelToJson(this);
}
