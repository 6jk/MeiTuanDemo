//
//  WineDescribeCell.m
//  kunyuan
//
//  Created by Mr.Gu on 17/2/21.
//  Copyright © 2017年 HeDongMing. All rights reserved.
//

#import "WineDescribeCell.h"
#import "Masonry.h"

#import "UILabel+Extersion.h"
#import "UIButton+Extersion.h"

@implementation WineDescribeCell
{
    UIImageView *_headerImageView;      // 图片
    UILabel *_titleLabel;               // 标题
    UILabel *_descLabel;                // 描述
    UILabel *_priceLabel;               // 价格
    
    UIButton *_plusButton;              // 增加
    UILabel *_countLabel;               // 数量
    UIButton *_minusButton;             // 减少
    
    NSInteger _countNum;               // 具体数量
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews
{
    _countNum = 0;
    
    _headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wineplaceholderimage"]];
    
    _titleLabel = [[UILabel alloc] initWithText:@"法国进口红酒 克鲁斯大帝干红葡萄酒双支盒装带酒具 750ml*2瓶" andTextAlignment:NSTextAlignmentLeft andFontSize:14 andTextColor:kDarkTextColor];
    _titleLabel.numberOfLines = 2;
    
    _descLabel = [[UILabel alloc] initWithText:@"月售100  攒10" andTextAlignment:NSTextAlignmentLeft andFontSize:12 andTextColor:kLightGrayColor];
    
    _priceLabel = [[UILabel alloc] init];
    NSAttributedString *priceStr = [self setupAttributeStringWithPrice:@"188"];
    [_priceLabel setAttributedText:priceStr];
    
    _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_plusButton setBackgroundImage:[UIImage imageNamed:@"plusButtonImage"] forState:UIControlStateNormal];
    _plusButton.tag = 0;
    [_plusButton addTarget:self action:@selector(calculateCount:) forControlEvents:UIControlEventTouchUpInside];
    
    _countLabel = [[UILabel alloc] initWithText:[NSString stringWithFormat:@"%ld", _countNum] andTextAlignment:NSTextAlignmentCenter andFontSize:14 andTextColor:kDarkTextColor];
    _countLabel.hidden = YES;
    
    _minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_minusButton setBackgroundImage:[UIImage imageNamed:@"minusButtonImage"] forState:UIControlStateNormal];
    _minusButton.hidden = YES;
    _minusButton.tag = 1;
    [_minusButton addTarget:self action:@selector(calculateCount:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_headerImageView];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_descLabel];
    [self.contentView addSubview:_priceLabel];
    [self.contentView addSubview:_plusButton];
    [self.contentView addSubview:_countLabel];
    [self.contentView addSubview:_minusButton];
    
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(15);
        make.width.height.mas_equalTo(@60);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerImageView);
        make.left.equalTo(_headerImageView.mas_right).offset(15);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_titleLabel);
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.top.equalTo(_descLabel.mas_bottom).offset(8);
        make.bottom.equalTo(self.contentView).offset(-15);
    }];
    
    [_plusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(_priceLabel);
        make.width.height.mas_equalTo(@20);
    }];
    
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(_plusButton);
        make.right.equalTo(_plusButton.mas_left).offset(-10);
    }];
    
    [_minusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.height.equalTo(_plusButton);
        make.right.equalTo(_countLabel.mas_left).offset(-10);
    }];
    
}

- (void)calculateCount:(UIButton *)button
{
   _countNum = button.tag ? _countNum - 1 : _countNum + 1;

    _countLabel.text = [NSString stringWithFormat:@"%ld", _countNum];
    
    if (_countNum) {
        _minusButton.hidden = NO;
        _countLabel.hidden = NO;
    }else {
        _minusButton.hidden = YES;
        _countLabel.hidden = YES;
    }
    
    CGPoint startPoint = [self convertPoint:button.center toView:[UIApplication sharedApplication].keyWindow];
//    NSLog(@"加号按钮在Window的位置 X:%0.2f  Y:%0.2f", startPoint.x, startPoint.y);

    if ([self.delegate respondsToSelector:@selector(describeCell:increaseStartPoint:)] && !button.tag ) {
        [self.delegate describeCell:self increaseStartPoint:startPoint];
    }
    
    if ([self.delegate respondsToSelector:@selector(describeCellDidFinishDecrease:)] && button.tag) {
        [self.delegate describeCellDidFinishDecrease:self];
    }
    
}

- (NSAttributedString *)setupAttributeStringWithPrice:(NSString *)price
{
    NSString *priceString = [NSString stringWithFormat:@"¥ %@", price];
    
    NSMutableAttributedString *priceAttrStr = [[NSMutableAttributedString alloc] initWithString:priceString attributes:@{NSForegroundColorAttributeName : kRedColor, NSFontAttributeName : [UIFont fontWithName:@"GeezaPro-Bold" size:18]}];
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@" 起" attributes:@{NSForegroundColorAttributeName : kLightGrayColor, NSFontAttributeName : [UIFont systemFontOfSize:12]}];
    [priceAttrStr appendAttributedString:str];

    return priceAttrStr.copy;
}

@end
