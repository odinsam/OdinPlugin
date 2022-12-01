
import 'odinutils_platform_interface.dart';

class Odinutils {
  Future<String?> getPlatformVersion() {
    return OdinutilsPlatform.instance.getPlatformVersion();
  }
}
