//
//  ZYHCarView.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/16.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHCarView.h"
#import "ZYHCar.h"

@implementation ZYHCarView

+ (instancetype)carView {
    return [[[NSBundle mainBundle] loadNibNamed:@"CarView" owner:nil options:nil] firstObject];
}

/**
 * 如果 view 从 xib 中加载 ,就不会调用 init 方法和 initWithFrame ,会调用 initWithCoder
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

/**
 * 注意:如果子控件是从 xib 中创建,是处于未唤醒状态,所以不能往布局里面添加控件
 * 可以使用 awakeFromNib 方法做操作
 *
 */
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {

    }
    return self;
}

/**
 * 从 xib 中唤醒
 * 添加 xib 中创建的子控件
 */
- (void)awakeFromNib {
    [super awakeFromNib];

}

#pragma  mark - 布局子控件

- (void)layoutSubviews {
    [super layoutSubviews];

}


- (void)setCar:(ZYHCar *)car {
    _car = car;
}


@end
