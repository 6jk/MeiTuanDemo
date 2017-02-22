//
//  WineShopViewController.m
//  kunyuan
//
//  Created by Mr.Gu on 17/2/20.
//  Copyright © 2017年 HeDongMing. All rights reserved.
//

#import "WineShopViewController.h"
#import "StoreHeaderView.h"
#import "GGCategoryView.h"

#import "Masonry.h"

#define kHeaderHeight 100


@interface WineShopViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) StoreHeaderView *headerView;

@property (nonatomic, strong) GGCategoryView *segmentView;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation WineShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - privateFunction
- (void)setUpNavigationBar
{
    self.navigationController.delegate = self;
}

- (void)addSubViews
{
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.segmentView];
    [self.view addSubview:self.scrollView];
    
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.segmentView.mas_bottom);
    }];
    
    [self addPanGestureRecognizer];
}

- (UIScrollView *)setupScrollContentView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    
    NSArray *vcArray = @[@"WinesTypesViewController", @"WinesEvaluationViewController", @"StoreInfoViewController"];
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:vcArray.count];
    [vcArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        Class classVc = NSClassFromString(obj);
        UIViewController *vc = [[classVc alloc] init];
        
        [self gg_addChildController:vc intoView:scrollView];
        [tempArray addObject:vc.view];
    }];
    
    [tempArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [tempArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(scrollView);
        make.bottom.top.equalTo(scrollView);
    }];
    
    return scrollView;
}

- (void)addPanGestureRecognizer {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
}

- (void)panAction:(UIPanGestureRecognizer *)recognizer {
    CGPoint tranlate = [recognizer translationInView:self.view];
    
    [recognizer setTranslation:CGPointZero inView:self.view];
    
    CGFloat headerViewY = self.headerView.gg_y + tranlate.y;
    
    
    if (headerViewY > 0) {
        headerViewY = 0;
    }
    
    if (headerViewY < -100) {
        headerViewY = -100;
    }
    
    self.headerView.gg_y = headerViewY;
    [self.view layoutIfNeeded];
}

- (void)pageNumChange:(GGCategoryView *)sender {
    
    [self.scrollView scrollRectToVisible:CGRectMake(self.view.bounds.size.width * sender.pageNum, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height) animated:YES];
}

#pragma mark - 支持多手势操作
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark - lazy
- (UIView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[StoreHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.gg_width, 100)];
    }
    return _headerView;
}

- (GGCategoryView *)segmentView
{
    if (_segmentView == nil) {
        _segmentView = [[GGCategoryView alloc] init];
        _segmentView.backgroundColor = kWhiteColor;
        [_segmentView addTarget:self action:@selector(pageNumChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentView;
}

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [self setupScrollContentView];
        _scrollView.backgroundColor = kWhiteColor;
    }
    return _scrollView;
}

@end
