//
//  FirstViewController.m
//  Child-test
//
//  Created by Yomoo on 2018/1/12.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginViewController.h"
#import "TBCityIconFont.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor]];
    button.frame=CGRectMake(100, 100, 80, 50);
    [self.view addSubview:button];
}
-(void)buttonClick{
    LoginViewController *login=[[LoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}

@end
