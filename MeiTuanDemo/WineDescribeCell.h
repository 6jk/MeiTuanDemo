//
//  WineDescribeCell.h
//  kunyuan
//
//  Created by Mr.Gu on 17/2/21.
//  Copyright © 2017年 HeDongMing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WineDescribeCell;

@protocol WineDescribeCellDelegate <NSObject>

- (void)describeCell:(WineDescribeCell *)describeCell increaseStartPoint:(CGPoint)startPoint;

- (void)describeCellDidFinishDecrease:(WineDescribeCell *)describeCell;


@end

@interface WineDescribeCell : UITableViewCell

@property (nonatomic, weak) id<WineDescribeCellDelegate> delegate;

@end
