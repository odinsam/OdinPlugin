import 'dart:convert';
import 'package:crypto/crypto.dart';

extension OdinStringExtensions on String
{
  /// string to CharList  List<String>
  List<String> toCharList(){
    var chars = <String>[];
    for(var i=0;i<this.length;i++){
      chars.add(this[i]);
    }
    return chars;
  }

  /// string compare ignoreCase
  bool compareIgnoreCase(String other,{bool ignoreCase = true}){
    if(ignoreCase){
      return toLowerCase().compareTo(other.toLowerCase())==0;
    }
    return compareTo(other)==0;
  }

  /// string to Md5
  String toMd5({bool upperCase = false }){
    var str = md5.convert(utf8.encode(this)).toString();
    if(upperCase)
    {
      return str.toUpperCase();
    }
    return str;
  }

  /// string to SHA1 LowerCase
  String toSHA1({bool upperCase = false }){
    var str = sha1.convert(utf8.encode(this)).toString();
    if(upperCase)
    {
      return str.toUpperCase();
    }
    return str;
  }
}


