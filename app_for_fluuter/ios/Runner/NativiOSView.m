//
//  NativiOSView.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/11/15.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "NativiOSView.h"
#import <Flutter/Flutter.h>

@interface NativiOSView ()<FlutterPlatformView>

@end

@implementation NativiOSView




-(UIView *)view {
    return [UIView new];
}
@end
