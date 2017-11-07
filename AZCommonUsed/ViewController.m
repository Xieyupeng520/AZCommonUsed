//
//  ViewController.m
//  AZCommonUsed
//
//  Created by cocozzhang on 2017/11/7.
//  Copyright © 2017年 azz. All rights reserved.
//

#import "ViewController.h"
#import "LunarSolarConverter.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [UILabel new];
    label.text = @"请前往控制台看打印";
    label.textColor = [UIColor blackColor];
    label.alpha = 0.8;
    [label sizeToFit];
    label.center = self.view.center;
    [self.view addSubview:label];
    
    [LunarSolarConverter TestCalendar];
}

@end
