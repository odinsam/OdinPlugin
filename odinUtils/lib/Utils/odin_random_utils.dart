import 'dart:math';

class OdinRandomUtils{
  /// create random
  static Random createRandom({bool isSecure = false,int? seed}){
    return isSecure? Random.secure() : Random(seed);
  }
}