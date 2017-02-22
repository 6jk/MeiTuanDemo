//
//  WineCategroyCell.m
//  kunyuan
//
//  Created by Mr.Gu on 17/2/21.
//  Copyright © 2017年 HeDongMing. All rights reserved.
//

#import "WineCategroyCell.h"
#import "Masonry.h"

@implementation WineCategroyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (void)configSubViews
{
    self.textLabel.numberOfLines = 2;
    self.textLabel.textColor = [UIColor grayColor];
    self.textLabel.font = [UIFont systemFontOfSize:13];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = kOrangeColor;
    [self.selectedBackgroundView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(self.selectedBackgroundView);
        make.height.equalTo(self.selectedBackgroundView);
        make.width.mas_equalTo(3);
    }];
}

@end
