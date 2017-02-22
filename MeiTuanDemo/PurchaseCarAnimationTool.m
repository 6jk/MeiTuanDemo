//
//  PurchaseCarAnimationTool.m
//  PruchaseCarAnimation
//
//  Created by zhenyong on 16/8/17.
//  Copyright © 2016年 com.demo. All rights reserved.
//
#import "AppDelegate.h"
#import "PurchaseCarAnimationTool.h"

@interface PurchaseCarAnimationTool ()<CAAnimationDelegate>

@end

@implementation PurchaseCarAnimationTool
{
    UIImageView *_imageView;
}

+(instancetype)shareTool
{
//    static PurchaseCarAnimationTool *_instance;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [[PurchaseCarAnimationTool alloc] init];
//    });
//    return _instance;
    return [[PurchaseCarAnimationTool alloc] init];
}

-(void)startAnimationstartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint finishBlock:(animationFinisnBlock)completion
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_food_count_bg"]];

    _imageView.center = startPoint;
    [keyWindow addSubview:_imageView];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.duration = 1.0;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    
    [_imageView.layer addAnimation:animation forKey:@"path"];
    
    if (completion) {
        _animationFinisnBlock = completion;
    }
}


#pragma mark - CAanimation的代理方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (anim == [_imageView.layer animationForKey:@"path"]) {
        [_imageView removeFromSuperview];
        _imageView = nil;
        if (_animationFinisnBlock) {
            _animationFinisnBlock(YES);
        }
    }
    
}

+(void)shakeAnimation:(UIView *)shakeView
{
    CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    shakeAnimation.duration = 0.25f;
    shakeAnimation.fromValue = [NSNumber numberWithFloat:-5];
    shakeAnimation.toValue = [NSNumber numberWithFloat:5];
    shakeAnimation.autoreverses = YES;
    [shakeView.layer addAnimation:shakeAnimation forKey:nil];
}
@end
