//
//  WinesTypesViewController.m
//  kunyuan
//
//  Created by Mr.Gu on 17/2/20.
//  Copyright © 2017年 HeDongMing. All rights reserved.
//

#import "WinesTypesViewController.h"
#import "WineDescribeCell.h"
#import "WineCategroyCell.h"
#import "WineCartView.h"
#import "Masonry.h"

#import "PurchaseCarAnimationTool.h"

static NSString *categroyCellID = @"WineCategroyCell";
static NSString *wineCellID = @"WineDescribeCell";
//static NSString *headerID = @"headerID";

@interface WinesTypesViewController ()<UITableViewDataSource, UITableViewDelegate, WineDescribeCellDelegate>

@property (nonatomic, strong) UITableView *categoryTableView;

@property (nonatomic, strong) UITableView *detailTableView;

@property (nonatomic, strong) WineCartView *cartView;

@end

@implementation WinesTypesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - privateFunction
- (void)addSubViews
{
    [self.view addSubview:self.categoryTableView];
    [self.view addSubview:self.detailTableView];
    [self.view addSubview:self.cartView];
    
    [self.categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.view);
        make.width.mas_equalTo(self.view.gg_width/4);
    }];
    [self.detailTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.view);
        make.left.equalTo(self.categoryTableView.mas_right);
    }];
    [self.cartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
    self.categoryTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.categoryTableView.gg_width, 50)];
    self.detailTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.detailTableView.gg_width, 50)];
    
    NSIndexPath *defaultIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.categoryTableView selectRowAtIndexPath:defaultIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
}

#pragma mark - WineDescribeCellDelegate
- (void)describeCell:(WineDescribeCell *)describeCell increaseStartPoint:(CGPoint)startPoint
{

    CGPoint endP = [self.cartView convertPoint:self.cartView.imageViewCenter toView:[UIApplication sharedApplication].keyWindow];

    CGPoint controlPoint = CGPointMake(startPoint.x - 200, startPoint.y - 150);
    
    [[PurchaseCarAnimationTool shareTool] startAnimationstartPoint:startPoint endPoint:endP controlPoint:controlPoint finishBlock:^(BOOL finish) {
        NSLog(@"动画结束");
        self.cartView.count += 1;
    }];
}


- (void)describeCellDidFinishDecrease:(WineDescribeCell *)describeCell
{
    self.cartView.count -= 1;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return tableView.tag ? 10 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  tableView.tag ? 10 : 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag) {
        WineDescribeCell *cell = [tableView dequeueReusableCellWithIdentifier:wineCellID forIndexPath:indexPath];
        cell.delegate = self;
        return  cell;
    }else {
        WineCategroyCell *cell = [tableView dequeueReusableCellWithIdentifier:categroyCellID forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"酒种分类%ld",indexPath.row];
        return  cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return tableView.tag ? [NSString stringWithFormat:@"酒种分类%ld",section] : nil;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!tableView.tag) return;

    if (!(tableView.isDragging || tableView.isDecelerating || tableView.isTracking)) return;
    
    NSIndexPath *selectedIdx = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
    [self.categoryTableView selectRowAtIndexPath:selectedIdx animated:NO scrollPosition:UITableViewScrollPositionTop];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag) {
        NSLog(@"进入详情页");
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = @"详情页";
        vc.view.backgroundColor = kWhiteColor;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        [self.detailTableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - lazy

- (UITableView *)categoryTableView
{
    if (_categoryTableView == nil) {
        _categoryTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _categoryTableView.tag = 0;
        _categoryTableView.backgroundColor = RGBACOLOR(245, 245, 245, 1.0);
        _categoryTableView.dataSource = self;
        _categoryTableView.delegate = self;
        [_categoryTableView registerClass:[WineCategroyCell class] forCellReuseIdentifier:categroyCellID];
        _categoryTableView.showsVerticalScrollIndicator = NO;
    }
    return _categoryTableView;
}

- (UITableView *)detailTableView
{
    if (_detailTableView == nil) {
        _detailTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _detailTableView.tag = 1;
        _detailTableView.backgroundColor = RGBACOLOR(245, 245, 245, 1.0);
        _detailTableView.dataSource = self;
        _detailTableView.delegate = self;
        [_detailTableView registerClass:[WineDescribeCell class] forCellReuseIdentifier:wineCellID];
        _detailTableView.showsVerticalScrollIndicator = NO;
        
        _detailTableView.estimatedRowHeight = 80;
        _detailTableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _detailTableView;
}

- (WineCartView *)cartView
{
    if (_cartView == nil) {
        _cartView = [[WineCartView alloc] init];
    }
    return _cartView;
}

@end
