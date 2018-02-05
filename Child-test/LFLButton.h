//
//  LFLButton.h
//  Child-test
//
//  Created by Yomoo on 2018/2/2.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFLButton : UIButton
typedef NS_ENUM(NSUInteger, ZJImageAlignment) {
    /**
     *  图片在左，默认
     */
    ZJImageAlignmentLeft = 0,
    /**
     *  图片在上
     */
    ZJImageAlignmentTop,
    /**
     *  图片在下
     */
    ZJImageAlignmentBottom,
    /**
     *  图片在右
     */
    ZJImageAlignmentRight,
};


@property(nonatomic,assign)ZJImageAlignment imageAlignment;
/**
 *  按钮中图片与文字的间距
 */
@property(nonatomic,assign)CGFloat spaceBetweenTitleAndImage;
@end
