//
//  UIViewController+Extersion.h
//  kunyuan
//
//  Created by Mr.Gu on 17/2/20.
//  Copyright © 2017年 HeDongMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extersion)

-(void)setupForDismissKeyboard;

/**
 * 在当前视图控制器中添加子控制器，将子控制器的视图添加到 view 中
 *
 * @param childController 要添加的子控制器
 * @param view            要添加到的视图
 */
- (void)gg_addChildController:(UIViewController *)childController intoView:(UIView *)view;

@end
