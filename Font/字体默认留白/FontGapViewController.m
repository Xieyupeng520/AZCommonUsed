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
    
    UILabel* label22 = [self createLabel:@"空隙测试：22px" fontSize:11 frontLabel:nil];
    UILabel* label24 = [self createLabel:@"空隙测试：24px" fontSize:12 frontLabel:label22];
    UILabel* label28 = [self createLabel:@"空隙测试：28px" fontSize:14 frontLabel:label24];
    UILabel* label36 = [self createLabel:@"空隙测试：36px" fontSize:18 frontLabel:label28];
    UILabel* label38 = [self createLabel:@"空隙测试：38px" fontSize:19 frontLabel:label36];
    UILabel* label48 = [self createLabel:@"空隙测试：48px" fontSize:24 frontLabel:label38];
    UILabel* label52 = [self createLabel:@"空隙测试：52px" fontSize:26 frontLabel:label48];
    UILabel* label56 = [self createLabel:@"空隙测试：56px" fontSize:28 frontLabel:label52];
    UILabel* label72 = [self createLabel:@"空隙测试：72px" fontSize:36 frontLabel:label56];
    UILabel* label86 = [self createLabel:@"空隙测试：86px" fontSize:43 frontLabel:label72];
    UILabel* label90 = [self createLabel:@"空隙测试：90px" fontSize:45 frontLabel:label86];
    UILabel* label98 = [self createLabel:@"空隙测试：98px" fontSize:49 frontLabel:label90];
}

- (UILabel*)createLabel:(NSString*)text fontSize:(CGFloat)fontSize frontLabel:(UILabel*)labelFront {
    int margin = 15;
    
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

- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
