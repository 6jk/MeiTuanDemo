//
//  StoreHeaderView.m
//  kunyuan
//
//  Created by Mr.Gu on 17/2/20.
//  Copyright © 2017年 HeDongMing. All rights reserved.
//

#import "StoreHeaderView.h"
#import "UILabel+Extersion.h"
#import "Masonry.h"
#import "UIImageView+Extersion.h"

@implementation StoreHeaderView
{
    UIImageView *_storeImageView;
    UILabel *_storeNameLabel;
    UILabel *_descLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kLightGrayColor;
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews
{
    _storeImageView = [[UIImageView alloc] init];
    _storeImageView.backgroundColor = kDarkGrayColor;
    _storeNameLabel = [[UILabel alloc] initWithText:@"店名" andTextAlignment:NSTextAlignmentLeft andFontSize:16 andTextColor:kWhiteColor];
    
    _descLabel = [[UILabel alloc] initWithText:@"店铺描述" andTextAlignment:NSTextAlignmentLeft andFontSize:12 andTextColor:kWhiteColor];
    
    [self addSubview:_storeImageView];
    [self addSubview:_storeNameLabel];
    [self addSubview:_descLabel];
    
    [_storeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(15);
        make.width.height.mas_equalTo(60);
    }];
    
    [_storeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_storeImageView).offset(5);
        make.left.equalTo(_storeImageView.mas_right).offset(15);
    }];
    
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_storeNameLabel.mas_bottom).offset(10);
        make.left.equalTo(_storeNameLabel);
    }];
}


@end
