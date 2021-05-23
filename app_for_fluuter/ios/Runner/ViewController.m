//
//  ViewController.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/6/13.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "ViewController.h"

#import <Flutter/Flutter.h>
#import "SecondeSubViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    

    
}



- (IBAction)gotoFlutter:(id)sender {
    
    
    //com.flutter.cn
    FlutterViewController *vc = [[FlutterViewController alloc] init];
    
    [vc setInitialRoute:@"BatteryLevey"];
    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:@"com.flutter.cn" binaryMessenger:vc];
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
       
        NSLog(@"%@--%@",call.method,call.arguments);
        
        
        
        SecondeSubViewController *subVc = [[SecondeSubViewController alloc] init];
        [vc presentViewController:subVc animated:YES completion:nil];

        
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"flutter回调" message:[NSString stringWithFormat:@"%@",call.arguments] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        [alertView show];
        
//        NSLog(@"+++++++++++++++++");
//        
        NSLog(@"%@",vc);
        NSLog(@"%@",vc.tabBarController);
        NSLog(@"%@",vc.navigationController);
        
//        NSLog(@"%@",[UIApplication sharedApplication].keyWindow.rootViewController);
//        NSLog(@"%@",self);
//        
//        NSLog(@"%@",self.navigationController);
//        NSLog(@"+++++++++++++++++");
        
        result(@"返回的数据");
        
    }];
    
}
- (IBAction)gotoBatteryLevelVc:(UIButton *)sender {
    
}

@end

