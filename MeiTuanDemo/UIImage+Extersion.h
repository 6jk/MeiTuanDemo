//
//  UIImage+Extersion.h
//  DrawImage
//
//  Created by Mr.Gu on 16/6/15.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extersion)

- (void)gg_asyncDrawImageWithSize:(CGSize)size andCornerRadius:(BOOL)corner andBackColor:(UIColor *)color andfinished:(void(^)(UIImage *resultImage))finished;
@end
