//
//  CustomPluginManager.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/8/9.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "CustomPluginManager.h"


// 其实自定义，可以更加简单一点，直接使用该类就可以实现。同时，可以使用FlutterViewController.
// 作为BbinaryMessenger。
@interface CustomPluginManager ()

@property(nonatomic, strong) FlutterMethodChannel *mehodChannel;
@property(nonatomic, strong) FlutterViewController *viewController;


@end

@implementation CustomPluginManager

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {

//    FlutterMethodChannel *channel =
//    [FlutterMethodChannel methodChannelWithName:@"plugins.flutter.io/url_launcher"
//                                binaryMessenger:registrar.messenger];
//    UIViewController *viewController =
//    [UIApplication sharedApplication].delegate.window.rootViewController;
//    FLTUrlLauncherPlugin *plugin =
//    [[FLTUrlLauncherPlugin alloc] initWithViewController:viewController];
//    [registrar addMethodCallDelegate:plugin channel:channel];
    
    NSLog(@"%@",registrar);
    CustomPluginManager *pluginManager  = [[CustomPluginManager alloc] init];


    FlutterMethodChannel *methodChannel = [FlutterMethodChannel
                                           methodChannelWithName:@"plugins.flutter.io/customPluginManager"
                                           binaryMessenger:registrar.messenger];
    
    pluginManager.mehodChannel = methodChannel;
    pluginManager.viewController = (FlutterViewController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    
    [registrar addMethodCallDelegate:pluginManager channel:methodChannel];
    
    
}


-(void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    
    NSLog(@"----------------");
    NSLog(@"%@",self.viewController);
    NSLog(@"%@",self.mehodChannel);
    NSLog(@"%@-%@", call.method, call.arguments);
     NSLog(@"----------------");
    if ([call.method isEqualToString:@"iosInfo"]) {
        // do something。 xxxx
        
        result(@"result: ios-zhuCj");
    }
    
}




@end
