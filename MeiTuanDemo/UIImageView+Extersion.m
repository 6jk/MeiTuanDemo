//
//  UIImageView+Extersion.m
//  DrawImage
//
//  Created by Mr.Gu on 16/6/12.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "UIImageView+Extersion.h"
#import "UIImage+Extersion.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (Extersion)

- (void)gg_setImageWithURL:(NSString *)urlString
        andPlaceholderName:(NSString *)placeholderName
                   andSize:(CGSize)size
           andCornerRadius:(BOOL)corner
              andBackColor:(UIColor *)color
{
    
    UIImage *placeholderImage = [[UIImage alloc] init];
    
    // 判断有没有展位图片
    if (placeholderName) {
        placeholderImage = [UIImage imageNamed:placeholderName];
    }
    
    // 判断有没有 url
    if (!urlString) {
        [placeholderImage gg_asyncDrawImageWithSize:size andCornerRadius:YES andBackColor:color andfinished:^(UIImage *resultImage) {
            self.image = resultImage;
        }];
        
        return;
    }
    
    NSURL *url = [NSURL URLWithString:urlString];

    // 判断是否要裁切
    if (!corner) {
        [self sd_setImageWithURL:url placeholderImage:placeholderImage];
        return;
    }else{
    
        [self sd_setImageWithURL:url placeholderImage:placeholderImage options:SDWebImageProgressiveDownload completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            [image gg_asyncDrawImageWithSize:size andCornerRadius:corner andBackColor:color andfinished:^(UIImage *resultImage) {
                
                self.image = resultImage;
            }];
        }];
    }
}

- (void)gg_setImage:(UIImage *)image
                   andSize:(CGSize)size
           andCornerRadius:(BOOL)corner
              andBackColor:(UIColor *)color
{
    [image gg_asyncDrawImageWithSize:size andCornerRadius:corner andBackColor:color andfinished:^(UIImage *resultImage) {
        
        self.image = resultImage;
        
    }];
}


@end
