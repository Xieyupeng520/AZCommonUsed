//
//  FontGapViewController.m
//  AZCommonUsed
//
//  Created by cocozzhang on 2017/11/10.
//  Copyright © 2017年 azz. All rights reserved.
//

#import "FontGapViewController.h"

@interface FontGapViewController ()

@end

@implementation FontGapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel* label1 = [self createLabel:@"空隙测试：22px" fontSize:11 frontLabel:nil];
    UILabel* label2 = [self createLabel:@"空隙测试：24px" fontSize:12 frontLabel:label1];
    UILabel* label3 = [self createLabel:@"空隙测试：28px" fontSize:14 frontLabel:label2];
    UILabel* label4 = [self createLabel:@"空隙测试：36px" fontSize:18 frontLabel:label3];
    UILabel* label5 = [self createLabel:@"空隙测试：48px" fontSize:24 frontLabel:label4];
    UILabel* label6 = [self createLabel:@"空隙测试：56px" fontSize:28 frontLabel:label5];
    UILabel* label7 = [self createLabel:@"空隙测试：86px" fontSize:43 frontLabel:label6];
}

- (UILabel*)createLabel:(NSString*)text fontSize:(CGFloat)fontSize frontLabel:(UILabel*)labelFront {
    int margin = 50;
    
    UILabel *label = [UILabel new];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    [label sizeToFit];
    CGRect frame = label.frame;
    frame.origin = CGPointMake(margin, margin + CGRectGetMaxY(labelFront.frame));
    label.frame = frame;
    [self.view addSubview:label];
    
    return label;
}

@end
