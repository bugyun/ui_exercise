//
//  ZYHCarGroup.h
//  ui_exercise
//
//  Created by 若云 on 2018/10/24.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYHCarGroup : NSObject

@property(nonatomic, copy) NSString *header;
@property(nonatomic, copy) NSString *footer;
@property(nonatomic, strong) NSArray *cars;

+ (ZYHCarGroup *)carGroupWithDic:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
