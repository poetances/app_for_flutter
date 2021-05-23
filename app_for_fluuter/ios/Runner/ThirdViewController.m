//
//  ThirdViewController.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/6/13.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "ThirdViewController.h"

#import <Flutter/Flutter.h>

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //com.flutter.cn
    FlutterViewController *vc = [[FlutterViewController alloc] init];
    
    [vc setInitialRoute:@"Third"];
    
    [self presentViewController:vc animated:YES completion:nil];
}
@end
