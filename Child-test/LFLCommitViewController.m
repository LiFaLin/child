//
//  LFLCommitViewController.m
//  Child-test
//
//  Created by Yomoo on 2018/2/2.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import "LFLCommitViewController.h"
#import "LFLCommit.h"
#import "LFLCommitCell.h"
#import "LFLCommitFrame.h"
#import <MJRefresh.h>
#import "LFLImgLeftBtn.h"

@interface LFLCommitViewController ()<UITableViewDelegate,UITableViewDataSource,ZJCommitCellDelegate>
@property(nonatomic ,strong) UITableView        *mainTable;
// 数据源
@property(nonatomic ,strong) NSMutableArray     *dataArray;
// 索引
@property(nonatomic ,assign) NSInteger          pageNum;
@end

@implementation LFLCommitViewController

- (void)viewDidLoad {
    self.view.backgroundColor = kWhiteColor;
    self.title = @"评论";
    self.pageNum = 1;
    [self setUpAllView];
    [self getCommitsData];
    // 返回
   
    
}

-(void)setUpAllView{
    
    _mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    _mainTable.delegate = self;
    _mainTable.dataSource = self;
    _mainTable.backgroundColor = kWhiteColor;
    _mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_mainTable];
    
    //    kWeakObject(self);
    //    self.mainTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    //        weakObject.pageNum = 1;
    //        [weakObject getCommitsData];
    //    }];
    //
    //    self.mainTable.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
    //        weakObject.pageNum += 1;
    //        [weakObject getCommitsData];
    //    }];
}

#pragma mark - 获取数据
- (void)getCommitsData {
    [self.mainTable.mj_header endRefreshing];
    [self.mainTable.mj_footer endRefreshing];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CommitsData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *commitsList = [rootDict objectForKey:@"comments_list"];
    NSMutableArray *arrM = [NSMutableArray array];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSDictionary *dictDict in commitsList) {
            LFLCommitFrame *cFrame = [[LFLCommitFrame alloc]init];
            cFrame.commit = [LFLCommit commitWithDict:dictDict];
            [arrM addObject:cFrame];
        }
        self.dataArray = arrM;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.mainTable reloadData];
        });
    });
    
}

-(void)leftBackAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - ZJCommitCellDelegate
// 点赞
- (void)likeBtnClickAction:(LFLImgLeftBtn *)sender{
    sender.selected = !sender.isSelected;
    if (sender.isSelected) {
        [sender setImage:kImageName(@"new_organize_like") forState:UIControlStateNormal];
    }else{
        [sender setImage:kImageName(@"new_organize_dislike") forState:UIControlStateNormal];
    }
}
// 差评
- (void)disLikeBtnClickAction:(LFLImgLeftBtn *)sender{
    sender.selected = !sender.isSelected;
    if (sender.isSelected) {
        [sender setImage:kImageName(@"new_unlike_sele") forState:UIControlStateNormal];
    }else{
        [sender setImage:kImageName(@"new_unlike_unsele") forState:UIControlStateNormal];
    }
}
// 删除评论
-(void)deleteBtnClickAction:(UIButton *)sender{
    NSLog(@"删除");
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LFLCommitCell *cell = [LFLCommitCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selfVc = self;
    LFLCommitFrame *cFrame = self.dataArray[indexPath.row];
    cell.commitFrame = cFrame;
    [cell setChildBtnTag:indexPath.row];
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LFLCommitFrame *cFrame = self.dataArray[indexPath.row];
    return cFrame.cellHeight;
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    
    NSLog(@"销毁ZJCommitViewController");
}


@end
