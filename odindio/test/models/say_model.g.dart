// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'say_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SayModel _$SayModelFromJson(Map<String, dynamic> json) => SayModel(
      statuss: json['statuss'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$SayModelToJson(SayModel instance) => <String, dynamic>{
      'statuss': instance.statuss,
      'data': instance.data,
      'msg': instance.msg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      content: json['content'] as String?,
      author: json['author'] as String?,
      origin: json['origin'] as String?,
      link: json['link'] as String?,
      isComment: json['is_comment'] as bool?,
      likes: json['likes'] as int?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'author': instance.author,
      'origin': instance.origin,
      'link': instance.link,
      'is_comment': instance.isComment,
      'likes': instance.likes,
      'created_at': instance.createdAt,
    };
