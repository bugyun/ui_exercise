//
//  ZYHCarGroup.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/24.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHCarGroup.h"
#import "ZYHCar.h"

@implementation ZYHCarGroup

+ (ZYHCarGroup *)carGroupWithDic:(NSDictionary *)dict {
    ZYHCarGroup *group = [[self alloc] init];
    [group setValuesForKeysWithDictionary:dict];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        ZYHCar *car = [ZYHCar carWithDict:carDict];
        [temp addObject:car];
    }
    group.cars = temp;
    return group;
}


@end
