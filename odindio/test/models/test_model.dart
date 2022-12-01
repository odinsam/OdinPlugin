import 'package:json_annotation/json_annotation.dart';
import 'package:odindio/odin_reflect.dart';

part 'test_model.g.dart';

@odinReflectable
@JsonSerializable()
class TestModel extends Object {

  @JsonKey(name: 'slideshow')
  Slideshow slideshow;

  TestModel(this.slideshow,);

  factory TestModel.fromJson(Map<String, dynamic> srcJson) => _$TestModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TestModelToJson(this);

}


@JsonSerializable()
class Slideshow extends Object {

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'slides')
  List<Slides> slides;

  @JsonKey(name: 'title')
  String title;

  Slideshow(this.author,this.date,this.slides,this.title,);

  factory Slideshow.fromJson(Map<String, dynamic> srcJson) => _$SlideshowFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SlideshowToJson(this);

}


@JsonSerializable()
class Slides extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  Slides(this.title,this.type,);

  factory Slides.fromJson(Map<String, dynamic> srcJson) => _$SlidesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SlidesToJson(this);

}


