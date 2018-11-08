//
//  ZYHCar.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/24.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "ZYHCar.h"

@implementation ZYHCar

+ (ZYHCar *)carWithDict:(NSDictionary *)dict {
    ZYHCar *car = [[self alloc] init];
    [car setValuesForKeysWithDictionary:dict];
    return car;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.icon forKey:@"icon"];
}

//解析文件的时候调用(告诉当前文件要解析哪些属性)
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.icon = [coder decodeObjectForKey:@"icon"];
    }
    return self;
}

@end
