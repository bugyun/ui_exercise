//
//  ZYHShopView.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/16.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHShopView.h"
#import "ZYHShop.h"

@interface ZYHShopView ()//类扩展,私有属性
@property(nonatomic, weak) UIImageView *icon;
@end

@implementation ZYHShopView

/**
 * 初始化控件(不要设置 frame,因为拿不到具体的 frame)
 */
- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

/**
 * 注意:创建对象用[[xxx alloc]init] 方法和[[xxx alloc]initWithFrame] ,都会调用 initWithFrame:方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}


/**
 * 布局子控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];
}

/**
 * set 方法:只要外边传数据就会调用
 * 作用:设置数据
 * @param shop
 */
- (void)setShop:(ZYHShop *)shop {
    _shop = shop;
}
@end
