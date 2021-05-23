//
//  CustomPluginRegistrant.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/8/9.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "CustomPluginRegistrant.h"
#import "CustomPluginManager.h"
#import "Runner-Swift.h"
#import "PlatformViewPlugin.h"

@implementation CustomPluginRegistrant

+(void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {

    [CustomPluginManager registerWithRegistrar:[registry registrarForPlugin:@"CustomPluginManager"]];

    [ThirdMapPlugin registerWithRegistrar:[registry registrarForPlugin:@"ThirdMapPlugin"]];
 
    [PlatformViewPlugin registerWithRegistrar:[registry registrarForPlugin:@"PlatformViewPlugin"]];
    
}

@end
