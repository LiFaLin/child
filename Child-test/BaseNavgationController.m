//
//  BaseNavgationController.m
//  Child-test
//
//  Created by Yomoo on 2018/1/11.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import "BaseNavgationController.h"

@interface BaseNavgationController ()

@end

@implementation BaseNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBarTintColor:[UIColor whiteColor]];
    
    //设置样式
    [bar setTitleTextAttributes:@{
                                  NSForegroundColorAttributeName : [UIColor blackColor],
                                  NSFontAttributeName : [UIFont systemFontOfSize:18]
                                  }];
    //取消半透明
    bar.translucent = NO;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.view.backgroundColor=[UIColor whiteColor];
    }
    [super pushViewController:viewController animated:animated];
}


@end
