//
//  CustomPluginRegistrant.h
//  Runner
//
//  Created by Zhu ChaoJun on 2019/8/9.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>


NS_ASSUME_NONNULL_BEGIN

@interface CustomPluginRegistrant : NSObject

+(void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry;

@end

NS_ASSUME_NONNULL_END
