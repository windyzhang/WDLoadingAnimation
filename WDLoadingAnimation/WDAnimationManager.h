//
//  WDAnimationManager.h
//  WDLoadingAnimation
//
//  Created by Mac on 2018/6/27.
//  Copyright © 2018年 windyzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//动画类型
typedef NS_ENUM(NSUInteger, WDAnimationType){
    WDAnimationTypePreview,//预览
    WDAnimationTypeRotation,// 旋转
    WDAnimationTypeShadow,// 渐变
    WDAnimationTypeEmitter,// 粒子
    WDAnimationTypeCircle,// 波纹
    WDAnimationTypeWave,// 波浪
    WDAnimationTypeTriangle,// 三角形
    WDAnimationTypeGrid,// 网格
    WDAnimationTypeShake,// 震动条
    WDAnimationTypeRound,// 转圈动画
    WDAnimationTypeHeart,// 心动画
    WDAnimationTypeTurn,//翻转
};

@interface WDAnimationManager : NSObject

+ (CALayer *)replicatorLayerWithType:(WDAnimationType)type;
// 波纹
+ (CALayer *)replicatorLayer_Circle;
// 波浪
+ (CALayer *)replicatorLayer_Wave;
// 三角形
+ (CALayer *)replicatorLayer_Triangle;
// 网格
+ (CALayer *)replicatorLayer_Grid;
// 震动条
+ (CALayer *)replicatorLayer_Shake;
// 转圈动画
+ (CALayer *)replicatorLayer_Round;
// 心动画
+ (CALayer *)replicatorLayer_Heart;

@end
