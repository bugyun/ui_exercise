//
//  ZYHPerson.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/18.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHPerson.h"

@implementation ZYHPerson

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"self.name"];
        self.money = [coder decodeFloatForKey:@"self.money"];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"self.name"];
    [coder encodeFloat:self.money forKey:@"self.money"];
}


@end
