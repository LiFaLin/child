//
//  LFLCommitCell.h
//  Child-test
//
//  Created by Yomoo on 2018/2/2.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LFLCommitFrame,LFLImgLeftBtn;
@protocol ZJCommitCellDelegate <NSObject>
/**
 * 点赞代理方法回调
 
 @param sender 按钮
 */
- (void)likeBtnClickAction:(LFLImgLeftBtn *)sender;

/**
 * 差评代理方法回调
 
 @param sender 按钮
 */
- (void)disLikeBtnClickAction:(LFLImgLeftBtn *)sender;

/**
 * 删除评论代理方法回调
 
 @param sender 按钮
 */
-(void)deleteBtnClickAction:(UIButton *)sender;
@end
@interface LFLCommitCell : UITableViewCell
// 点赞按钮
@property(nonatomic, weak) LFLImgLeftBtn             *likeBtn;
// 差评
@property(nonatomic, weak) LFLImgLeftBtn             *disLikeBtn;
// 是否有数据
@property(nonatomic ,assign) BOOL isHaveData;

//模型
@property(nonatomic, strong) LFLCommitFrame *commitFrame;

@property(nonatomic ,weak) id<ZJCommitCellDelegate> delegate;

@property(nonatomic ,weak) UIViewController *selfVc;

+(instancetype)cellWithTableView:(UITableView *)tableView;

// 设置索引
-(void)setChildBtnTag:(NSInteger)tag;

@end
