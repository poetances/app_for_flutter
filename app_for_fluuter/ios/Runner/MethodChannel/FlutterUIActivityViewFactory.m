//
//  FlutterUIActivityView.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/11/18.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "FlutterUIActivityViewFactory.h"
#import "FlutterUIActivityView.h"

@implementation FlutterUIActivityViewFactory {
    NSObject<FlutterBinaryMessenger> *_binaryMessager;
    
}

-(instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessager{
    self = [super init];
    if (self) {
        _binaryMessager = binaryMessager;
    }
    return self;
}

- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args {
    
    FlutterUIActivityView *activityView = [[FlutterUIActivityView alloc] initWithParams:args binaryMessenger:_binaryMessager];
    return activityView;
}

- (NSObject<FlutterMessageCodec> *)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

@end
