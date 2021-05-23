//
//  FlutterUIActivityView.h
//  Runner
//
//  Created by Zhu ChaoJun on 2019/11/18.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterUIActivityViewFactory : NSObject<FlutterPlatformViewFactory>


-(instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessager;
@end

NS_ASSUME_NONNULL_END
