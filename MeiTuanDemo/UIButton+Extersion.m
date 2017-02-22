//
//  UIButton+Extersion.m
//  WeiYiMi
//
//  Created by Mr.Gu on 16/4/26.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "UIButton+Extersion.h"

@implementation UIButton (Extersion)

- (instancetype)initWithText:(NSString *)text fontSize:(CGFloat)size textColor:(UIColor *)color forState:(UIControlState)state
{
    self = [super init];
    if (self) {
        [self setTitle:text forState:state];
        [self setTitleColor:color forState:state];
        self.titleLabel.font = [UIFont systemFontOfSize:size];
    }
    return self;
}

- (instancetype)initWithAttributeString:(NSString *)string andImageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] init];
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:imageName];
        attach.bounds = CGRectMake(0, -7, 25, 25);
        NSAttributedString *attributeStr = [NSAttributedString attributedStringWithAttachment:attach];
        [attributeString appendAttributedString:attributeStr];
        NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [attributeString appendAttributedString:titleString];
        [self setAttributedTitle:attributeString forState:UIControlStateNormal];
    }
    return self;
}

- (instancetype)initWithLevelAttributeString:(NSString *)string levelString:(NSString *)levelString imageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        self.titleLabel.numberOfLines = 3;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] init];
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:imageName];
        attach.bounds = CGRectMake(0, -8, 25, 25);
        NSAttributedString *attributeStr = [NSAttributedString attributedStringWithAttachment:attach];
        [attributeString appendAttributedString:attributeStr];
        
        NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGBACOLOR(235, 129, 16, 1.0)}];
        [attributeString appendAttributedString:titleString];
        
        NSAttributedString *spaceString = [[NSAttributedString alloc] initWithString:@" \n" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8]}];
        [attributeString appendAttributedString:spaceString];
        
        NSAttributedString *string = [[NSAttributedString alloc] initWithString:levelString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:RGBACOLOR(235, 129, 16, 1.0)}];
        [attributeString appendAttributedString:string];
        
        [self setAttributedTitle:attributeString forState:UIControlStateNormal];
    }
    return self;
}

- (instancetype)initWithAttributeString:(NSString *)string andNameString:(NSString *)nameString andTextColor:(UIColor *)textColor
{
    self = [super init];
    if (self) {
        if (string && nameString) { // 只有当参数都有值的时候才创建富文本
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] init];
            
            NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:textColor}];
            [attributeString appendAttributedString:titleString];
            
            NSAttributedString *spaceString = [[NSAttributedString alloc] initWithString:@"\n" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
            [attributeString appendAttributedString:spaceString];
            
            NSAttributedString *string = [[NSAttributedString alloc] initWithString:nameString attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:textColor}];
            [attributeString appendAttributedString:string];
            
            [self setAttributedTitle:attributeString forState:UIControlStateNormal];
        }
    }
    return self;
}

- (instancetype)initWithImageName:(NSString *)imageName andString:(NSString *)string textColor:(UIColor *)textColor
{
    self = [super init];
    if (self) {
        self.titleLabel.numberOfLines = 3;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] init];
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:imageName];
        attach.bounds = CGRectMake(0, 0, 27, 27);
        NSAttributedString *attributeStr = [NSAttributedString attributedStringWithAttachment:attach];
        [attributeString appendAttributedString:attributeStr];
        
        NSAttributedString *spaceString = [[NSAttributedString alloc] initWithString:@"\n \n" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:6]}];
        [attributeString appendAttributedString:spaceString];
        
        NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:textColor}];
        [attributeString appendAttributedString:titleString];
        [self setAttributedTitle:attributeString forState:UIControlStateNormal];
    }
    return self;
}

- (instancetype)initWithOriginalImage:(NSString *)imageName andString:(NSString *)string textColor:(UIColor *)textColor
{
    self = [super init];
    if (self) {
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] init];
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:imageName];
        attach.image = [UIImage imageNamed:imageName];
        attach.bounds = CGRectMake(0, 0, 27, 27);
        NSAttributedString *attributeStr = [NSAttributedString attributedStringWithAttachment:attach];
        [attributeString appendAttributedString:attributeStr];
        
        NSAttributedString *spaceString = [[NSAttributedString alloc] initWithString:@"\n" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
        [attributeString appendAttributedString:spaceString];
        
        NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:textColor}];
        [attributeString appendAttributedString:titleString];
        [self setAttributedTitle:attributeString forState:UIControlStateNormal];
    }
    return self;
}


- (void)setImageName:(NSString *)imageName andString:(NSString *)string textColor:(UIColor *)textColor
{
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] init];
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:imageName];
    attach.bounds = CGRectMake(0, 0, 27, 27);
    NSAttributedString *attributeStr = [NSAttributedString attributedStringWithAttachment:attach];
    [attributeString appendAttributedString:attributeStr];
    
    NSAttributedString *spaceString = [[NSAttributedString alloc] initWithString:@"\n" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    [attributeString appendAttributedString:spaceString];
    
    NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:textColor}];
    [attributeString appendAttributedString:titleString];
    [self setAttributedTitle:attributeString forState:UIControlStateNormal];
}

+ (instancetype )ggButtonWithText:(NSString *)title fontSize:(CGFloat)size normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:size];
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
 
    return button;
}

@end
