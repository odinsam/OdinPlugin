//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <odindio/odindio_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) odindio_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "OdindioPlugin");
  odindio_plugin_register_with_registrar(odindio_registrar);
}
