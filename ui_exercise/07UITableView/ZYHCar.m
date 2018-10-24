//
//  ZYHCar.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/24.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHCar.h"

@implementation ZYHCar

+ (ZYHCar *)carWithDict:(NSDictionary *)dict {
    ZYHCar *car = [[self alloc] init];
    [car setValuesForKeysWithDictionary:dict];
    return car;
}
@end
