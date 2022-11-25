
import 'odindio_platform_interface.dart';

class Odindio {
  Future<String?> getPlatformVersion() {
    return OdindioPlatform.instance.getPlatformVersion();
  }
}
