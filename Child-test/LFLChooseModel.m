//
//  LFLChooseModel.m
//  Child-test
//
//  Created by Yomoo on 2018/2/5.
//  Copyright © 2018年 Yomoo. All rights reserved.
//

#import "LFLChooseModel.h"

@implementation LFLChooseModel
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.name = dict[@"name"];
        self.res_id = dict[@"res_id"];
        self.child_list = dict[@"child_list"];
    }
    return self;
}

+(instancetype)chooseWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
