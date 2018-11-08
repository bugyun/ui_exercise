//
//  ZYHPerson.h
//  ui_exercise
//
//  Created by 若云 on 2018/10/18.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYHPerson : NSObject <NSCoding>

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) float money;

- (instancetype)initWithCoder:(NSCoder *)coder;

- (void)encodeWithCoder:(NSCoder *)coder;

@end

NS_ASSUME_NONNULL_END
