//
//  LFLCommitFrame.h
//  Child-test
//
//  Created by Yomoo on 2018/2/2.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class LFLCommit;
@interface LFLCommitFrame : NSObject
// commit 模型
@property(nonatomic, strong) LFLCommit *commit;

// 头像Frame
@property(nonatomic, assign) CGRect iconFrame;

// 昵称Frame
@property(nonatomic, assign) CGRect nameFrame;

// 评论内容Frame
@property(nonatomic, assign) CGRect contentFrame;

// 喜欢按钮Frame
@property(nonatomic, assign) CGRect likeFrame;

// 不喜欢按钮Frame
@property(nonatomic, assign) CGRect disLikeFrame;

// 时间Frame
@property(nonatomic, assign) CGRect timeFrame;

// 删除按钮Frame
@property(nonatomic ,assign) CGRect deleteFrame;

// 配图Frame
@property(nonatomic, assign) CGRect photosFrame;

// 星级Frame
@property(nonatomic, assign) CGRect starFrame;

// cell的高度
@property(nonatomic, assign) CGFloat cellHeight;
@end
