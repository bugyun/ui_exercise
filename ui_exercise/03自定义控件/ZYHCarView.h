//
//  ZYHCarView.h
//  ui_exercise
//
//  Created by 若云 on 2018/10/16.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYHCar;

NS_ASSUME_NONNULL_BEGIN

@interface ZYHCarView : UIView
@property(nonatomic, strong) ZYHCar *car;

//提供快速创建的方法
+ (instancetype)carView;

@end

NS_ASSUME_NONNULL_END
