//
//  UILabel+Extersion.m
//  WeiYiMi
//
//  Created by Mr.Gu on 16/4/24.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "UILabel+Extersion.h"

@implementation UILabel (Extersion)

- (instancetype)initWithText:(NSString *)text andTextAlignment:(NSTextAlignment)textAlignment andFontSize:(CGFloat)size andTextColor:(UIColor *)color
{
    self = [super init];
    if (self) {
        if (text != nil) {
            self.text = text;
        }
        self.textAlignment = textAlignment;
        if (size != 0) {
            self.font = [UIFont systemFontOfSize:size];
        }
        if (color != nil) {
            self.textColor = color;
        }
        self.numberOfLines = 2;
    }
    return self;
}


- (void)gg_setAttributeSting:(NSString *)string appendAttributeSting:(NSString *)appendString appendStingColor:(UIColor *)textColor
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    NSAttributedString *appendAttributeString = [[NSAttributedString alloc] initWithString:appendString attributes:@{NSForegroundColorAttributeName : textColor}];
    [attributeString appendAttributedString:appendAttributeString];
    
    [self setAttributedText:attributeString];
}

@end
