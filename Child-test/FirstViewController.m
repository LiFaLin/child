//
//  FirstViewController.m
//  Child-test
//
//  Created by Yomoo on 2018/1/12.
//  Copyright © 2018年 Yomoo. All rights reserved.
//
#define kWarningDuration   1.8
#import "FirstViewController.h"
#import "LoginViewController.h"
#import "TBCityIconFont.h"
#import <MBProgressHUD.h>
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor greenColor]];
    button.frame=CGRectMake(10, 10, 80, 30);
    [self.view addSubview:button];
    
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"图片切换" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor greenColor]];
    button1.frame=CGRectMake(10, 100, 80, 30);
    [self.view addSubview:button1];
    
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"筛选" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor greenColor]];
    button2.frame=CGRectMake(10, 190, 80, 30);
    [self.view addSubview:button2];
    
    
    UIButton *button3=[UIButton buttonWithType:UIButtonTypeCustom];
    [button3 addTarget:self action:@selector(button3Click) forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitle:@"评论" forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor greenColor]];
    button3.frame=CGRectMake(10, 280, 80, 30);
    [self.view addSubview:button3];
}
-(void)buttonClick{
    LoginViewController *login=[[LoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}

-(void)button1Click{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        MBProgressHUD * hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode=MBProgressHUDModeCustomView;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        NSArray *imageNames = @[@"001", @"002",@"003",@"004",@"005",@"006", @"007"];
        NSMutableArray<UIImage *> *imgs = [NSMutableArray new];
        for (NSString *imageName in imageNames) {
            if ([UIImage imageNamed:imageName]!= nil) {
                [imgs addObject:[UIImage imageNamed:imageName]];
            }
            
        }
        imageView.animationImages = imgs;
        hud.customView = imageView;
        imageView.animationDuration = 1.0;
        [imageView startAnimating];
        //         hud.color = [UIColor clearColor];
        hud.backgroundColor=[UIColor clearColor];
        //[hud hide:YES afterDelay:kTimeOutDuration];
        [hud hideAnimated:YES afterDelay:kWarningDuration];
    });
}

-(void)button2Click{
    
}

-(void)button3Click{
    
}
@end
