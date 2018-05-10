//
//  UIView+Custom.m
//  AZCommonUsed
//
//  Created by cocozzhang on 2018/5/10.
//  Copyright © 2018年 azz. All rights reserved.
//

#import "UIView+Custom.h"

@implementation UIView (Custom)
#pragma mark - 设置局部圆角
- (void)setCornerRound:(UIRectCorner)corner radius:(CGSize)cornerRadii {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
@end
