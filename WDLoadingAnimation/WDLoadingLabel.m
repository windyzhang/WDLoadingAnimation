//
//  WDLoadingLabel.m
//  WDLoadingAnimation
//
//  Created by Mac on 2018/6/27.
//  Copyright © 2018年 windyzhang. All rights reserved.
//

#import "WDLoadingLabel.h"

@implementation WDLoadingLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont boldSystemFontOfSize:35];
        self.textColor = [UIColor redColor];
    }
    return self;
}

- (void)showLoadingToView:(NSString *)text {
    
    if (text) {
        self.text = text;
    }
    [self sizeToFit];
    
    CAGradientLayer *graLayer = [CAGradientLayer layer];
    graLayer.frame = self.bounds;
    graLayer.colors = @[(__bridge id)[[UIColor greenColor] colorWithAlphaComponent:0.3].CGColor,
                        (__bridge id)[UIColor yellowColor].CGColor,
                        (__bridge id)[[UIColor yellowColor] colorWithAlphaComponent:0.3].CGColor];
    graLayer.startPoint = CGPointMake(0, 0.1);//设置渐变方向起点
    graLayer.endPoint = CGPointMake(1, 0);  //设置渐变方向终点
    graLayer.locations = @[@(0.0), @(0.0), @(0.1)]; //colors中各颜色对应的初始渐变点
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.duration = 1.0f;
    animation.toValue = @[@(0.9), @(1.0), @(1.0)];
    animation.removedOnCompletion = NO;
    animation.repeatCount = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    [graLayer addAnimation:animation forKey:@"shadow-layer"];
    
    self.layer.mask = graLayer;
}

- (void)hide {
    [self removeFromSuperview];
}

@end
