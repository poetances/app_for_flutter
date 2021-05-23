//
//  FlutterUIActivityView.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/11/18.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "FlutterUIActivityView.h"

@implementation FlutterUIActivityView {
    UILabel *_lab;
}

-(instancetype)initWithParams:(id)params binaryMessenger:(nonnull NSObject<FlutterBinaryMessenger> *)binaryMessenger{
    self = [super init];
    if (!self) return nil;
    
    NSLog(@"收到参数：%@", params);
    _lab = [[UILabel alloc] init];
    _lab.text = @"FlutterUIActivityView-ios";
    _lab.textColor = [UIColor purpleColor];
    _lab.backgroundColor = [UIColor purpleColor];
    _lab.font = [UIFont systemFontOfSize:16];
    _lab.textAlignment = NSTextAlignmentCenter;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 10, 50, 50);
    btn.backgroundColor = [UIColor blackColor];
    [_lab addSubview:btn];
    
    
    FlutterMethodChannel *channerl = [FlutterMethodChannel methodChannelWithName:@"com.FlutterUIActivityViewFactory.cn" binaryMessenger:binaryMessenger];
    
    [channerl setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
    }];
    
    return self;
}

- (UIView *)view {
    return _lab;
}
@end
