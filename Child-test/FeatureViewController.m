//
//  FeatureViewController.m
//  Child-test
//
//  Created by Yomoo on 2018/1/11.
//  Copyright © 2018年 Yomoo. All rights reserved.
//
#define FEATURECOUNT 3
#import "FeatureViewController.h"
#import "BaseTabBarController.h"
@interface FeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation FeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = self.view.bounds;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *FEATURECOUNT, 0);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    for (int i = 0; i < FEATURECOUNT; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"page%d.jpg",i+1]];
        [_scrollView addSubview:imageView];
        
        //在最后一页添加内容
        if (i == FEATURECOUNT - 1)
        {
            [self setupLastImageView:imageView];
        }
    }
    
    //分页
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(40, SCREEN_HEIGHT - 30, SCREEN_WIDTH - 80, 30)];
    _pageControl.numberOfPages = FEATURECOUNT;
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.userInteractionEnabled = NO;
    [self.view addSubview:_pageControl];
}
- (void)setupLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled = YES;
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 110)/2.0, SCREEN_HEIGHT*0.8, 110, 30)];
    startBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    startBtn.layer.borderWidth = 1;
    startBtn.clipsToBounds = YES;
    startBtn.layer.cornerRadius = 15;
    startBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [startBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [startBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = _scrollView.contentOffset.x/SCREEN_WIDTH;
    
}

- (void)startBtnClick
{
    [_scrollView removeFromSuperview];
    
    BaseTabBarController *vc = [[BaseTabBarController alloc] init];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = vc;
}



@end
