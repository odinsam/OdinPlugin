import 'dart:math';
import '../../Utils/odin_random_utils.dart';

extension OdinRandomExtensions on Random{
  int odinNextInt(int maxValue,{bool isSecure = false,int? seed,int minValue=0}){
    var rnd = OdinRandomUtils.createRandom(isSecure:isSecure,seed: seed);
    return minValue + rnd.nextInt(maxValue);
  }

  double odinNextDouble(double maxValue,{bool isSecure = false,int? seed,double minValue=0}){
    var rnd = OdinRandomUtils.createRandom(isSecure:isSecure,seed: seed);
    return minValue + rnd.nextDouble()*maxValue;
  }
}