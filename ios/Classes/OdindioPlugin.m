#import "OdindioPlugin.h"
#if __has_include(<odindio/odindio-Swift.h>)
#import <odindio/odindio-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "odindio-Swift.h"
#endif

@implementation OdindioPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOdindioPlugin registerWithRegistrar:registrar];
}
@end
