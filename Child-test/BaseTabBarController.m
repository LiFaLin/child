//
//  BaseTabBarController.m
//  Child-test
//
//  Created by Yomoo on 2018/1/11.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavgationController.h"
#import "FirstViewController.h"
#import "KidsViewController.h"
#import "VideoViewController.h"
#import "MineViewController.h"
#import "TBCityIconFont.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    FirstViewController *equi=[[FirstViewController alloc]init];
    BaseNavgationController *nav=[[BaseNavgationController alloc]initWithRootViewController:equi];
    equi.navigationItem.title=@"首页";
    equi.tabBarItem.title=@"首页";
    equi.tabBarItem.image=[UIImage imageNamed:@"首页2"];
    equi.tabBarItem.selectedImage=[[UIImage imageNamed:@"首页"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    KidsViewController *kids=[[KidsViewController alloc]init];
    BaseNavgationController *nav1=[[BaseNavgationController alloc]initWithRootViewController:kids];
    kids.navigationItem.title=@"育儿";
    kids.tabBarItem.title=@"育儿";
    kids.tabBarItem.image=[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e619", 25, [UIColor redColor])];
    kids.tabBarItem.selectedImage=[[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    VideoViewController *video=[[VideoViewController alloc]init];
    BaseNavgationController *nav2=[[BaseNavgationController alloc]initWithRootViewController:video];
    video.navigationItem.title=@"视频";
    video.tabBarItem.title=@"视频";
    video.tabBarItem.image=[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e61b", 25, [UIColor redColor])];
    video.tabBarItem.selectedImage=[[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MineViewController *mine=[[MineViewController alloc]init];
    BaseNavgationController *nav3=[[BaseNavgationController alloc]initWithRootViewController:mine];
    mine.navigationItem.title=@"个人主页";
    mine.tabBarItem.title=@"设置";
    mine.tabBarItem.image=[UIImage imageNamed:@"我的2"];
    mine.tabBarItem.selectedImage=[[UIImage imageNamed:@"我的"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSArray *array=[NSArray arrayWithObjects:nav,nav1,nav2,nav3, nil];
    self.viewControllers=array;
}



@end
