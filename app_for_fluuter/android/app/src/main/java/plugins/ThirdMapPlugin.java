package plugins;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.PluginRegistry;



public class ThirdMapPlugin implements MethodCallHandler {

    public static String CHANNEL = "com.zcj.third_map_plugin.cn";

    private Context context;

    public ThirdMapPlugin(Context context) {
        this.context = context;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        final MethodChannel channel =
                new MethodChannel(registrar.messenger(), CHANNEL);
        ThirdMapPlugin instance = new ThirdMapPlugin(registrar.context());
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        switch (methodCall.method) {
            case "hasInstalledMapApp":
                result.success(hasInstalledMapApp());
                break;
            case "openBaiduMap":
                openBaiduMap((Map<String, String>) methodCall.arguments);
                break;
            case "openAmap":
                openAmap((Map<String, String>) methodCall.arguments);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private ArrayList<String> hasInstalledMapApp() {
        ArrayList<String> installedApps = new ArrayList<>();

        // 百度地图包名。/data/data/com.baidu.BaiduMap
        File baiduFile = new File("/data/data/com.baidu.BaiduMap");
        if (baiduFile.exists()) {
            installedApps.add("百度地图");
        }

        // 高德地图包名。 /data/data/com.autonavi.minimap
        File amapFile = new File("/data/data/com.autonavi.minimap");
        if (amapFile.exists()) {
            installedApps.add("高德地图");
        }
        return  installedApps;
    }


    private void openBaiduMap(Map<String, String> argmentsDic) {
        String dlatitude = argmentsDic.get("dlatitude");
        String dlongitude = argmentsDic.get("dlongitude");
        String dName = argmentsDic.get("dName");


        String baiduUrl = "baidumap://map/direction?destination=latlng:" +
                dlatitude + "," +
                dlongitude + "|name:" +
                dName +
                "&src=andr.baidu.openAPIdemo";
        openThirdMap(baiduUrl);
    }

    private void openAmap(Map<String, String> argmentsDic) {
        String dlatitude = argmentsDic.get("dlatitude");
        String dlongitude = argmentsDic.get("dlongitude");
        String dName = argmentsDic.get("dName");


        String amapUrl = "androidamap://route/plan?dlat=" +
                dlatitude + "&dlon=" +
                dlongitude + "&dname=" + dName;

        openThirdMap(amapUrl);
    }

    private void openThirdMap(String uri) {
        Intent intent = new Intent();
        intent.setData(Uri.parse(uri));
        context.startActivity(intent);
    }


}
