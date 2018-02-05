//
//  LFLChooseView.m
//  Child-test
//
//  Created by Yomoo on 2018/2/5.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import "LFLChooseView.h"
#import "LFLChooseModel.h"
#import "LFLButton.h"
@implementation LFLChooseView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}




-(void)btnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if ([self.delegate respondsToSelector:@selector(chooseControlWithBtnArray:button:)]) {
        [self.delegate chooseControlWithBtnArray:self.btnArr button:sender];
    }
}


-(void)setUpAllViewWithTitleArr:(NSArray *)titleArr{
    
    for (int i = 0; i<titleArr.count; i++) {
        LFLButton *btn = [[LFLButton alloc]init];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:kLightGrayColor forState:UIControlStateNormal];
        [btn setTitleColor:k16RGBColor(0xFF960C) forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:@"下拉"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"上拉"] forState:UIControlStateSelected];
        btn.imageAlignment = ZJImageAlignmentRight;
        btn.spaceBetweenTitleAndImage = 3;
        btn.tag = i;
        btn.titleLabel.font = kFontWithSize(13);
        CGFloat btnW = kScreenWidth/4;
        CGFloat btnX = i*btnW;
        btn.frame = CGRectMake(btnX, 0, btnW, 45);
        [self addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.btnArr addObject:btn];
    }
    
    CGFloat margin = kScreenWidth/4;
    for (int i = 0; i<3; i++) {
        UIView *line = [[UIView alloc]init];
        
        line.backgroundColor = k16RGBColor(0xDDDDDD);
        
        CGFloat w = 0.5;
        CGFloat h = 23;
        CGFloat x = (margin + w) * (i+1);
        CGFloat y = 8;
        line.frame = CGRectMake(x, y, w, h);
        [self addSubview:line];
    }
    
}


-(NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}

@end
