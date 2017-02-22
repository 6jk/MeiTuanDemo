//
//  WineCartView.m
//  kunyuan
//
//  Created by Mr.Gu on 17/2/21.
//  Copyright © 2017年 HeDongMing. All rights reserved.
//

#import "WineCartView.h"
#import "Masonry.h"

#import "UILabel+Extersion.h"
#import "UIButton+Extersion.h"

@implementation WineCartView
{
    UIImageView *_cartImageView;
    UILabel *_countLabel;
    UILabel *_pricelabel;
    UIButton *_purchaseButton;
    NSInteger _goodCount;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        self.effect = blurEffect;
        [self configSubViews];
        _goodCount = 0;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showShoppingCartDetailView)];
        [self addGestureRecognizer:tapGesture];
        
    }
    return self;
}

- (void)configSubViews
{
    _cartImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"button_shoppingCart_empty"]];
    
    _countLabel = [[UILabel alloc] initWithText:@"nil" andTextAlignment:NSTextAlignmentCenter andFontSize:10 andTextColor:kWhiteColor];
    _countLabel.hidden = YES;
    _countLabel.backgroundColor = kRedColor;
    _countLabel.layer.cornerRadius = 8;
    _countLabel.layer.masksToBounds = YES;
    
    _pricelabel = [[UILabel alloc] initWithText:@"配送费以订单为准" andTextAlignment:NSTextAlignmentLeft andFontSize:14 andTextColor:kWhiteColor];
    
    _purchaseButton = [[UIButton alloc] initWithText:@"¥ 30起送" fontSize:18 textColor:kWhiteColor forState:UIControlStateNormal];
    [_purchaseButton addTarget:self action:@selector(clickPuichaseButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_cartImageView];
    [_cartImageView addSubview:_countLabel];
    [self addSubview:_pricelabel];
    [self addSubview:_purchaseButton];
    
    [_cartImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.width.height.mas_equalTo(@50);
        make.bottom.equalTo(self).offset(-10);
    }];

    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(16);
        make.top.right.equalTo(_cartImageView);
    }];
    
    [_pricelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(_cartImageView.mas_right).offset(10);
    }];
    
    [_purchaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self);
        make.width.mas_equalTo(100);
    }];
}

- (void)setCount:(NSInteger)count
{
    _goodCount = count;
    if (_goodCount) {
        _countLabel.hidden = NO;
        _cartImageView.image = [UIImage imageNamed:@"button_shoppingCart_noEmpty"];
        _countLabel.text = [NSString stringWithFormat:@"%ld",(long)_goodCount];
    }else {
        _countLabel.hidden = YES;
        _cartImageView.image = [UIImage imageNamed:@"button_shoppingCart_empty"];
    }
}

- (NSInteger)count
{
    return _goodCount;
}

- (CGPoint)imageViewCenter
{
    return _cartImageView.center;
}

- (void)clickPuichaseButton
{
    NSLog(@"点击结算按钮");
}

- (void)showShoppingCartDetailView
{
    NSLog(@"点击购物车");
}

@end
