//
//  UIButton+Extersion.h
//  WeiYiMi
//
//  Created by Mr.Gu on 16/4/26.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extersion)

/// 图片接文字 -- 富文本
///
/// @param string    文字
/// @param imageName 图片名
- (instancetype)initWithAttributeString:(NSString *)string
                           andImageName:(NSString *)imageName;


/// 图片接文字+换行文字 -- 富文本
///
/// @param string      图片后的文字
/// @param levelString 换行后的文字
/// @param imageName   图片名字
- (instancetype)initWithLevelAttributeString:(NSString *)string
                                 levelString:(NSString *)levelString
                                   imageName:(NSString *)imageName;

/// 商品收藏类:数字+文字 -- 富文本
///
/// @param string     数字
/// @param nameString 文字描述
/// @param textColor  文字颜色
- (instancetype)initWithAttributeString:(NSString *)string
                          andNameString:(NSString *)nameString
                           andTextColor:(UIColor *)textColor;

/// 图片换行文字
///
/// @param imageName 图片名
/// @param string    文字
/// @param textColor 文字颜色
- (instancetype)initWithImageName:(NSString *)imageName andString:(NSString *)string textColor:(UIColor *)textColor;


/// 图片换行文字(图片原始大小)
///
/// @param imageName 图片名
/// @param string    文字
/// @param textColor 文字颜色
- (instancetype)initWithOriginalImage:(NSString *)imageName andString:(NSString *)string textColor:(UIColor *)textColor;

/// 按钮的初始化方法
///
/// @param text  按钮文字
/// @param size  文字大小
/// @param color 文字颜色
/// @param state 按钮状态
- (instancetype)initWithText:(NSString *)text
                    fontSize:(CGFloat)size
                   textColor:(UIColor *)color
                    forState:(UIControlState)state;


/// 图片换行文字(对象方法)
///
/// @param imageName 图片名
/// @param string    文字
/// @param textColor 文字颜色
- (void)setImageName:(NSString *)imageName
           andString:(NSString *)string
           textColor:(UIColor *)textColor;

+ (UIButton *)ggButtonWithText:(NSString *)title fontSize:(CGFloat)size normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;

@end
