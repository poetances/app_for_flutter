//
//  SecondeViewController.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/6/13.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "SecondeViewController.h"
#import <Flutter/Flutter.h>
#import "SecondeSubViewController.h"

@interface SecondeViewController ()

@end

@implementation SecondeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //com.flutter.cn
    FlutterViewController *vc = [[FlutterViewController alloc] init];

    [vc setInitialRoute:@"Seconde"];

    [self presentViewController:vc animated:YES completion:nil];
    
    
    
}

@end
