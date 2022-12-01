import 'package:odindio/reflector.dart';
import 'package:reflectable/mirrors.dart';
const odinReflectable = Reflector();
class OdinReflect {
  static T reflectInstanceFromMap<T>(Map<String, dynamic> map,
      {methodName = "fromJson"}) {
    ClassMirror classMirror = odinReflectable.reflectType(T) as ClassMirror;
    var instance = classMirror.newInstance(methodName, [map]) as T;
    return instance;
  }
}