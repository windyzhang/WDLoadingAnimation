//
//  WDEmitterLayerView.h
//  WDLoadingAnimation
//
//  Created by Mac on 2018/6/27.
//  Copyright © 2018年 windyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDEmitterLayerView : UIView

@property (nonatomic, strong) UIImage *snowImage;
@property (nonatomic, assign) CGFloat lifetime;   // 生命周期
@property (nonatomic, assign) CGFloat birthRate;  // 出生率
@property (nonatomic, assign) CGFloat speed;      // 雪花速率
@property (nonatomic, assign) CGFloat speedRange; // 速率变化范围 [speed - speedRange , speed + speedRange]
@property (nonatomic, assign) CGFloat gravity;    // 重力
@property (nonatomic, strong) UIColor *snowColor;  // 雪花颜色

- (void)showSnow;
- (void)show;
- (void)hide;

@end
