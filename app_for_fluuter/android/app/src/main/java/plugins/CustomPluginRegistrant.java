package plugins;
import io.flutter.plugin.common.PluginRegistry;


public class CustomPluginRegistrant {

    public static void registerWith(PluginRegistry registry) {
        if (alreadyRegisteredWith(registry)) {
            return;
        }

        ThirdMapPlugin.registerWith(registry.registrarFor("plugins.ThirdMapPlugin"));
    }

    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = CustomPluginRegistrant.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        registry.registrarFor(key);
        return false;
    }
}
