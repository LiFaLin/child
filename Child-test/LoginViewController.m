//
//  LoginViewController.m
//  Child-test
//
//  Created by Yomoo on 2018/1/16.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import "LoginViewController.h"
#import <Masonry.h>
@interface LoginViewController ()
@property(nonatomic,strong)UIImageView * imageView;
@property(nonatomic,strong)UITextField *NametextField;
@property(nonatomic,strong)UITextField *PWtextField;
@property(nonatomic,strong)UIButton *loginButton;
@property(nonatomic,strong)UIButton *registerButton;
@property(nonatomic,strong)UIButton *resetButton;
@property(nonatomic,strong)UILabel * label;
@property(nonatomic,strong)UILabel * label1;
@property(nonatomic,strong)UILabel * label2;
@end

@implementation LoginViewController

-(UIImageView*)imageView{
    if (_imageView==nil) {
        _imageView=[[UIImageView alloc]init];
        _imageView.image=[UIImage imageNamed:@"logo.jpg"];
    }
    return _imageView;
}
-(UITextField*)NametextField{
    if (_NametextField==nil) {
        _NametextField=[[UITextField alloc]init];
        _NametextField.placeholder=@"请输入用户名";
        //        _NametextField.layer.borderWidth= 1.0f;
        //        _NametextField.clipsToBounds=YES;
        [_NametextField setValue:[NSNumber numberWithInt:30] forKey:@"paddingLeft"];
        
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(-20, 10, 20, 20)];
        UIImageView *nameImage=[[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 17, 22)];
        nameImage.image=[UIImage imageNamed:@"形状1"];
        [view addSubview:nameImage];
        _NametextField.leftView=view;
        _NametextField.leftViewMode=UITextFieldViewModeAlways;
        _NametextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        _NametextField.layer.cornerRadius=20;
        _NametextField.layer.borderColor=[UIColor colorWithRed:21/255.0 green:147/255.0 blue:134/255.0 alpha:1].CGColor;
        _NametextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _NametextField;
}
-(UITextField*)PWtextField{
    if (_PWtextField==nil) {
        _PWtextField=[[UITextField alloc]init];
        _PWtextField.placeholder=@"密码";
        //        _PWtextField.layer.borderWidth= 1.0f;
        //        _PWtextField.clipsToBounds=YES;
        //        _PWtextField.layer.cornerRadius=20;
        [_PWtextField setValue:[NSNumber numberWithInt:30] forKey:@"paddingLeft"];
        
        UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(-20, 10, 20, 20)];
        UIImageView *nameImage1=[[UIImageView alloc]initWithFrame:CGRectMake(20, -3, 17, 22)];
        nameImage1.image=[UIImage imageNamed:@"形状2"];
        [view1 addSubview:nameImage1];
        _PWtextField.leftView=view1;
        _PWtextField.leftViewMode=UITextFieldViewModeAlways;
        _PWtextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        _PWtextField.layer.borderColor=[UIColor colorWithRed:21/255.0 green:147/255.0 blue:153/255.0 alpha:1].CGColor;
        _PWtextField.secureTextEntry=YES;
        _PWtextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _PWtextField;
}

-(UILabel*)label{
    if (_label==nil) {
        _label=[[UILabel alloc]init];
        _label.backgroundColor=[UIColor lightGrayColor];
    }
    return _label;
}

-(UILabel*)label1{
    if (_label1==nil) {
        _label1=[[UILabel alloc]init];
        _label1.backgroundColor=[UIColor lightGrayColor];
    }
    return _label1;
}
-(UIButton*)loginButton{
    if (_loginButton==nil) {
        _loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor=[UIColor colorWithRed:79/255.0 green:199/255.0 blue:134/255.0 alpha:1];
        _loginButton.layer.cornerRadius=20;
        _loginButton.clipsToBounds=YES;
        [_loginButton addTarget:self action:@selector(loginButtonButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _loginButton;
}
-(UIButton*)registerButton{
    if (_registerButton==nil) {
        _registerButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(resetButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_registerButton setTitleColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1] forState:UIControlStateNormal];
        _registerButton.titleLabel.font=[UIFont systemFontOfSize:15];
    }
    return _registerButton;
}
-(UILabel*)label2{
    if (_label2==nil) {
        _label2=[[UILabel alloc]init];
        _label2.textColor=[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
        _label2.text=@"还没有";
        _label2.font=[UIFont systemFontOfSize:15];
        _label2.textAlignment=NSTextAlignmentRight;
        
    }
    return _label2;
}

-(UIButton*)resetButton{
    if (_resetButton==nil) {
        _resetButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_resetButton setTitle:@"注册？" forState:UIControlStateNormal];
        [_resetButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_resetButton setTitleColor:[UIColor colorWithRed:79/255.0 green:199/255.0 blue:134/255.0 alpha:1] forState:UIControlStateNormal];
        _resetButton.titleLabel.font=[UIFont systemFontOfSize:15];
    }
    return _resetButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.NametextField];
    [self.view addSubview:self.label];
    [self.view addSubview:self.PWtextField];
    [self.view addSubview:self.label1];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.resetButton];
    [self.view addSubview:self.label2];
    [self updateViewConstraintsForSubView];
}
-(void)updateViewConstraintsForSubView{
    __weak typeof(self)weakSelf = self ;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(0);
        make.left.equalTo(weakSelf.view).offset(0);
        make.right.equalTo(weakSelf.view).offset(0);
        make.height.equalTo(@200);
        
    }];
    
    [self.NametextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.imageView.mas_bottom).offset(40);
        make.left.equalTo(weakSelf.view).offset(40);
        make.right.equalTo(weakSelf.view).offset(-40);
        make.height.equalTo(@30);
    }];
    
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.NametextField.mas_bottom).offset(0);
        make.left.equalTo(weakSelf.NametextField).offset(40);
        make.right.equalTo(weakSelf.view).offset(-60);
        make.height.equalTo(@1);
    }];
    
    [self.PWtextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.NametextField.mas_bottom).offset(40);
        make.left.equalTo(weakSelf.view).offset(40);
        make.right.equalTo(weakSelf.view).offset(-40);
        make.height.equalTo(@30);
    }];
    
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.PWtextField.mas_bottom).offset(0);
        make.left.equalTo(weakSelf.PWtextField).offset(40);
        make.right.equalTo(weakSelf.view).offset(-60);
        make.height.equalTo(@1);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.PWtextField.mas_bottom).offset(40);
        make.left.equalTo(weakSelf.view).offset(50);
        make.right.equalTo(weakSelf.view).offset(-50);
        make.height.equalTo(@45);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginButton.mas_bottom).offset(2);
        make.left.equalTo(weakSelf.view).offset(50);
        make.width.equalTo(@90);
        make.height.equalTo(@30);
    }];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginButton.mas_bottom).offset(2);
        make.right.equalTo(weakSelf.view).offset(-90);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    
    [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginButton.mas_bottom).offset(2);
        make.width.equalTo(@60);
        make.right.equalTo(weakSelf.view).offset(-30);
        make.height.equalTo(@30);
    }];
}

-(void)loginButtonButtonClick{
    //    if ([_NametextField.text isEqualToString:@""]) {
    //        UIAlertController *alterControl = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入用户名" preferredStyle:UIAlertControllerStyleAlert];
    //        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //
    //        }];
    //        [alterControl addAction:okAction];
    //        [self presentViewController:alterControl animated:YES completion:nil];
    //    }
    //    if ([_PWtextField.text isEqualToString:@""]) {
    //        UIAlertController *alterControl = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入密码" preferredStyle:UIAlertControllerStyleAlert];
    //        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //
    //        }];
    //        [alterControl addAction:okAction];
    //        [self presentViewController:alterControl animated:YES completion:nil];
    //    }
    //
    //    if (![_NametextField.text isEqualToString:@""]&&![_PWtextField.text isEqualToString:@""]) {
    //
    //    }
    
}

-(void)resetButtonClick{
    
}
-(void)registerButtonClick{
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
