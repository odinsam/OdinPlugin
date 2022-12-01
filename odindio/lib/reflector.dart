import 'package:reflectable/reflectable.dart';
class Reflector extends Reflectable {
  const Reflector()
      : super(
      invokingCapability,
      declarationsCapability,
      typeRelationsCapability,
      libraryCapability); // Request the capability to invoke methods.
}