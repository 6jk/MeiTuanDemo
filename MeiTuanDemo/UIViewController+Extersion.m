//
//  UIViewController+Extersion.m
//  kunyuan
//
//  Created by Mr.Gu on 17/2/20.
//  Copyright © 2017年 HeDongMing. All rights reserved.
//

#import "UIViewController+Extersion.h"

@implementation UIViewController (Extersion)

- (void)setupForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    
    __weak UIViewController *weakSelf = self;
    
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [weakSelf.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [weakSelf.view removeGestureRecognizer:singleTapGR];
                }];
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
}

- (void)gg_addChildController:(UIViewController *)childController intoView:(UIView *)view  {
    
    // 1> 添加子控制器 － 否则响应者链条会被打断，导致事件无法正常传递，而且错误非常难改！
    [self addChildViewController:childController];
    
    // 2> 添加子控制器的视图
    [view addSubview:childController.view];
    
    // 3> 完成子控制器的添加
    [childController didMoveToParentViewController:self];
}


@end
