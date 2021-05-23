//
//  PlatformViewPlugin.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/11/18.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "PlatformViewPlugin.h"
#import "FlutterUIActivityViewFactory.h"

@implementation PlatformViewPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    

    
    [registrar registerViewFactory:[[FlutterUIActivityViewFactory alloc] initWithBinaryMessenger:registrar.messenger] withId:@"com.FlutterUIActivityViewFactory.cn"];
}

@end

