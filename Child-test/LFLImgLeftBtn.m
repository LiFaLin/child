//
//  LFLImgLeftBtn.m
//  Child-test
//
//  Created by Yomoo on 2018/2/2.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import "LFLImgLeftBtn.h"

@implementation LFLImgLeftBtn

// 对图片的标题和文字重新布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat imgW = CGRectGetWidth(self.imageView.bounds);;
    CGFloat titleH = CGRectGetHeight(self.titleLabel.bounds);
    CGFloat titleW = CGRectGetWidth(self.titleLabel.bounds);
    
    self.imageView.frame = CGRectMake(0, 0, imgW, CGRectGetHeight(self.imageView.bounds));
    self.titleLabel.frame = CGRectMake(imgW + 4, 0, titleW, titleH);
    
}


@end
