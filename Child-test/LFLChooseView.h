//
//  LFLChooseView.h
//  Child-test
//
//  Created by Yomoo on 2018/2/5.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZJChooseControlDelegate <NSObject>
// 点击按钮
-(void)chooseControlWithBtnArray:(NSArray *)array button:(UIButton *)sender;
@end
@interface LFLChooseView : UIView
@property(nonatomic ,strong) NSArray *titleArr;

@property(nonatomic ,weak) id<ZJChooseControlDelegate> delegate;
// 按钮数组
@property(nonatomic ,strong) NSMutableArray *btnArr;

-(void)setUpAllViewWithTitleArr:(NSArray *)titleArr;
@end
