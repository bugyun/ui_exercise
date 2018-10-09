//
//  UILableViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/9.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "UILableViewController.h"

@interface UILableViewController ()

@end

@implementation UILableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.1创建 UILabel 对象
    UILabel *label = [[UILabel alloc] init];

    //1.2设置 frame
    label.frame = CGRectMake(100, 100, 100, 75);

    //1.3设置背景颜色
    label.backgroundColor = [UIColor redColor];

    //1.4设置文字
    label.text = @"牛逼啊!!!!!!牛逼啊!!!!!!牛逼啊!!!!!!牛逼啊!!!!!!";

    //1.5居中
    label.textAlignment = NSTextAlignmentCenter;

    //1.6设置字体大小
    label.font = [UIFont systemFontOfSize:12.f];
    label.font = [UIFont boldSystemFontOfSize:12.f];//粗体
    label.font = [UIFont italicSystemFontOfSize:12.f];//斜体

    //1.7设置文字的颜色
    label.textColor = [UIColor purpleColor];

    //1.8设置阴影(默认有值)
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(-2, 1);

    //1.9设置行数
    label.numberOfLines = 0;

    //1.10显示模式
    /**
     *  NSLineBreakByWordWrapping = 0,     	// Wrap at word boundaries, default
        NSLineBreakByCharWrapping,		// Wrap at character boundaries
        NSLineBreakByClipping,		// Simply clip
        NSLineBreakByTruncatingHead,	// Truncate at head of line: "...wxyz"
        NSLineBreakByTruncatingTail,	// Truncate at tail of line: "abcd..."
        NSLineBreakByTruncatingMiddle	// Truncate middle of line:  "ab...yz"
     */
    label.lineBreakMode = NSLineBreakByWordWrapping;

    //2.0添加到控制器的 view 中
    [self.view addSubview:label];
}


@end
