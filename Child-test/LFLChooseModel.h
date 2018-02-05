//
//  LFLChooseModel.h
//  Child-test
//
//  Created by Yomoo on 2018/2/5.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFLChooseModel : NSObject
// 名字
@property(nonatomic ,copy) NSString *name;
// id
@property(nonatomic ,copy) NSString *res_id;
// 子数据
@property(nonatomic ,strong) NSArray *child_list;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)chooseWithDict:(NSDictionary *)dict;
@end
