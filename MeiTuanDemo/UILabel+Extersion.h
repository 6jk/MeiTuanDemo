//
//  UILabel+Extersion.h
//  WeiYiMi
//
//  Created by Mr.Gu on 16/4/24.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extersion)

/// @param text          文字内容
/// @param textAlignment 文字对齐格式
/// @param size          文字大小
/// @param color         文字颜色
- (instancetype)initWithText:(NSString *)text andTextAlignment:(NSTextAlignment)textAlignment andFontSize:(CGFloat)size andTextColor:(UIColor *)color;


/**
 设置富文本

 @param string       默认文字
 @param appendString 富文本文字
 @param textColor    富文本文字颜色
 */
- (void)gg_setAttributeSting:(NSString *)string appendAttributeSting:(NSString *)appendString appendStingColor:(UIColor *)textColor;
@end
