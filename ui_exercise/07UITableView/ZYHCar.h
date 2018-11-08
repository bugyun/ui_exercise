//
//  ZYHCar.h
//  ui_exercise
//
//  Created by 若云 on 2018/10/24.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYHCar : NSObject<NSCoding>

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *icon;

+ (ZYHCar *)carWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
