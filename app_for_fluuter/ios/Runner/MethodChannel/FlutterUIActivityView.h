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

@interface FlutterUIActivityView : NSObject<FlutterPlatformView>


-(instancetype)initWithParams:(id)params binaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger;
@end

NS_ASSUME_NONNULL_END
