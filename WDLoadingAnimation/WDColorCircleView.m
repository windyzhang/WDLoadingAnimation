//
//  WDColorCircleView.m
//  WDLoadingAnimation
//
//  Created by Mac on 2018/6/27.
//  Copyright © 2018年 windyzhang. All rights reserved.
//

#import "WDColorCircleView.h"

@implementation WDColorCircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    UIView *circleView = [[UIView alloc] init];
    circleView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    circleView.backgroundColor = [UIColor blueColor];
    [self addSubview: circleView];
    
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor whiteColor].CGColor,(__bridge id)[UIColor orangeColor].CGColor];
    gradientLayer.locations = @[@0.2,@1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [circleView.layer insertSublayer:gradientLayer atIndex:0];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGFloat radius = self.frame.size.width < self.frame.size.height ? self.frame.size.width/2.0 - 5 : self.frame.size.height/2.0 - 5;
    CGPathAddRelativeArc(pathRef, nil, self.frame.size.width/2.0, self.frame.size.height/2.0, radius, 0, 2*M_PI);
    layer.path = pathRef;
    layer.lineWidth = 5;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    CGPathRelease(pathRef);
    circleView.layer.mask = layer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = HUGE_VALF;
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    [circleView.layer addAnimation:animation forKey:@"rotate-layer"];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"加载中...";
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
}

@end
