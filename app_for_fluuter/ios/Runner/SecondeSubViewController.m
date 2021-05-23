//
//  SecondeSubViewController.m
//  Runner
//
//  Created by Zhu ChaoJun on 2019/6/13.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "SecondeSubViewController.h"

@interface SecondeSubViewController ()

@end

@implementation SecondeSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor lightGrayColor];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
