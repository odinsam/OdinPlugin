// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) => TestModel(
      Slideshow.fromJson(json['slideshow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'slideshow': instance.slideshow,
    };

Slideshow _$SlideshowFromJson(Map<String, dynamic> json) => Slideshow(
      json['author'] as String,
      json['date'] as String,
      (json['slides'] as List<dynamic>)
          .map((e) => Slides.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['title'] as String,
    );

Map<String, dynamic> _$SlideshowToJson(Slideshow instance) => <String, dynamic>{
      'author': instance.author,
      'date': instance.date,
      'slides': instance.slides,
      'title': instance.title,
    };

Slides _$SlidesFromJson(Map<String, dynamic> json) => Slides(
      json['title'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$SlidesToJson(Slides instance) => <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
    };
