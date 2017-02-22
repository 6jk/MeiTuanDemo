//
//  BaseViewController.m
//  WineTrade
//
//  Created by Mr.Gu on 17/1/24.
//  Copyright © 2017年 Mr.Gu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setUpNavigationBar];
    [self addSubViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - privateFunction
- (void)addSubViews{}

- (void)setUpNavigationBar{}

@end
