import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'odinutils_method_channel.dart';

abstract class OdinutilsPlatform extends PlatformInterface {
  /// Constructs a OdinutilsPlatform.
  OdinutilsPlatform() : super(token: _token);

  static final Object _token = Object();

  static OdinutilsPlatform _instance = MethodChannelOdinutils();

  /// The default instance of [OdinutilsPlatform] to use.
  ///
  /// Defaults to [MethodChannelOdinutils].
  static OdinutilsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OdinutilsPlatform] when
  /// they register themselves.
  static set instance(OdinutilsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
