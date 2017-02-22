//
//  PurchaseCarAnimationTool.h
//  PruchaseCarAnimation
//
//  Created by zhenyong on 16/8/17.
//  Copyright © 2016年 com.demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^animationFinisnBlock)(BOOL finish);

@interface PurchaseCarAnimationTool : NSObject

@property (copy , nonatomic) animationFinisnBlock animationFinisnBlock;

+(instancetype)shareTool;


/**
 购物车动画

 @param startPoint      起始点
 @param endPoint        结束点
 @param controlPoint    控制点
 */
-(void)startAnimationstartPoint:(CGPoint)startPoint
                       endPoint:(CGPoint)endPoint
                   controlPoint:(CGPoint)controlPoint
                    finishBlock:(animationFinisnBlock)completion;

@end
