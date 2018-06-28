//
//  WDAnimationViewController.m
//  WDLoadingAnimation
//
//  Created by Mac on 2018/6/27.
//  Copyright © 2018年 windyzhang. All rights reserved.
//

#import "WDAnimationViewController.h"
#import "WDLoadingLabel.h"
#import "WDColorCircleView.h"
#import "WDEmitterLayerView.h"

@interface WDAnimationViewController ()

@end

@implementation WDAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat width = 100;
    CGRect viewframe = CGRectMake((self.view.frame.size.width - width) / 2, 150, width, width);
    switch (_type) {
        case WDAnimationTypePreview:
            [self setupPreViewImage];
            break;
        case WDAnimationTypeRotation:
            [self setupRotationAnimation];
            break;
        case WDAnimationTypeShadow:
            [self setupShadowAnimation];
            break;
        case WDAnimationTypeEmitter:
            [self setupEmitterAnimation];
            break;
        case WDAnimationTypeShake:
            viewframe = CGRectMake(80, 200, width, width);
            [self setupView:viewframe];
            break;
        case WDAnimationTypeHeart:
            viewframe = CGRectMake(0, 64, width, width);
            [self setupView:viewframe];
            break;
        default:{
            [self setupView:viewframe];
        }
            break;
    }
   
}
- (void)setupView:(CGRect)viewframe {
    
    UIView *aniView = [[UIView alloc] initWithFrame:viewframe];
    [self.view addSubview:aniView];
    [aniView.layer addSublayer: [WDAnimationManager replicatorLayerWithType:_type]];
}
- (void)setupPreViewImage {
    
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 0; i < 9; i++) {
        NSString *imageName = [NSString stringWithFormat:@"Image%d",i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        [imageArray addObject:image];
    }
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 155, 100, 310, 170)];
    imageView.animationImages = imageArray;
    imageView.animationDuration = 5.0f;
    imageView.animationRepeatCount = 0;//图片播放次数,0表示无限
    [self.view addSubview:imageView];
    [imageView startAnimating];
}
- (void)setupRotationAnimation {
    
    WDColorCircleView *circle = [[WDColorCircleView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, 200, 100, 100)];
    [self.view addSubview:circle];
}
- (void)setupShadowAnimation {
    
    WDLoadingLabel *loadLabel = [[WDLoadingLabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, 200, 200, 100)];
    [loadLabel showLoadingToView:@"VariFlight"];
    [self.view addSubview:loadLabel];
}
- (void)setupEmitterAnimation {
    
    self.view.backgroundColor = [UIColor grayColor];
    WDEmitterLayerView *layerView = [[WDEmitterLayerView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    [self.view addSubview:layerView];
    
    layerView.snowImage = [UIImage imageNamed:@"white"];
    layerView.birthRate = 20.f;
    layerView.gravity = 5.f;
    layerView.snowColor = [UIColor whiteColor];
    
    CALayer *layer = [CALayer layer];
    layer.anchorPoint = CGPointMake(0, 0);// 重置锚点
    layer.bounds = CGRectMake(0, 0, self.view.frame.size.width, 200);// 设置尺寸
    UIImage *image = [UIImage imageNamed:@"black"];
    if (image) {
        layer.contents = (__bridge id)(image.CGImage);
    }
    layerView.layer.mask = layer;
    [layerView showSnow];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
