//
//  LFLChooseViewController.m
//  Child-test
//
//  Created by Yomoo on 2018/2/2.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import "LFLChooseViewController.h"
#import "LFLChooseShowView.h"
#import "LFLChooseView.h"

@interface LFLChooseViewController ()<UITableViewDelegate,UITableViewDataSource,ZJChooseControlDelegate>
@property(nonatomic ,strong) UITableView *mainTable;
@property(nonatomic ,weak) LFLChooseView *chooseControlView;
@property(nonatomic ,strong) LFLChooseShowView *showView;

@end

@implementation LFLChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"筛选";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
    self.title = @"ChooseView";
    [self setUpAllView];
}



-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setUpAllView{
    NSArray *array = @[@"全部商区",@"外语培训",@"智能排序",@"筛选"];
    LFLChooseView *chooseView = [[LFLChooseView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    chooseView.delegate = self;
    chooseView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    chooseView.layer.borderWidth = 0.5;
    [chooseView setUpAllViewWithTitleArr:array];
    _chooseControlView = chooseView;
    [self.view addSubview:chooseView];
    [self.view addSubview:self.mainTable];
}

-(LFLChooseShowView *)showView{
    if (!_showView) {
        _showView = [[LFLChooseShowView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, ScreenHeight - 104)];
        _showView.hidden = YES;
    }
    return _showView;
}

#pragma mark - 选中的按钮事件
-(void)chooseControlWithBtnArray:(NSArray *)array button:(UIButton *)sender{
    
    [self.view addSubview:self.showView];
    self.showView.hidden = NO;
    [self.showView chooseControlViewBtnArray:array Action:sender];
    
}

-(UITableView *)mainTable{
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, ScreenHeight-104) style:UITableViewStylePlain];
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        _mainTable.rowHeight = 50;
    }
    return _mainTable;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"testCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据:---->%ld",(long)indexPath.row];
    return cell;
}


@end
