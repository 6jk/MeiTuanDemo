//
//  UIImageView+Extersion.h
//  DrawImage
//
//  Created by Mr.Gu on 16/6/12.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extersion)

- (void)gg_setImageWithURL:(NSString *)urlString
        andPlaceholderName:(NSString *)placeholderName
                   andSize:(CGSize)size
           andCornerRadius:(BOOL)corner
              andBackColor:(UIColor *)color;

- (void)gg_setImage:(UIImage *)image
            andSize:(CGSize)size
    andCornerRadius:(BOOL)corner
       andBackColor:(UIColor *)color;
@end
