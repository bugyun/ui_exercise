//
//  UIButtonViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/11.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "UIButtonViewController.h"

@interface UIButtonViewController ()

@end

@implementation UIButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.1 创建UIButton对象
    /**
     *  UIButtonTypeCustom = 0,                         // no button type
        UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0),  // standard system button

        UIButtonTypeDetailDisclosure,
        UIButtonTypeInfoLight,
        UIButtonTypeInfoDark,
        UIButtonTypeContactAdd,

        UIButtonTypePlain API_AVAILABLE(tvos(11.0)) API_UNAVAILABLE(ios, watchos), // standard system button without the blurred background view

        UIButtonTypeRoundedRect = UIButtonTypeSystem
     */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    //1.2 设置 frame
    button.frame = CGRectMake(100, 100, 100, 100);

    //1.3 设置背景颜色
    button.backgroundColor = [UIColor redColor];

    /**
      UIControlStateNormal       = 0, 普通状态
      UIControlStateHighlighted  = 1 << 0,   高亮状态,按钮被按下去的时候(手指未松开)
      UIControlStateDisabled     = 1 << 1,   失效状态,如果 enabled 属性为 NO,就是处于 disable 状态,代表按钮不可以被点击
      UIControlStateSelected     = 1 << 2,
      UIControlStateFocused      = 1 << 3,
      UIControlStateApplication  = 0x00FF0000,
      UIControlStateReserved     = 0xFF000000
    */
    //1.4 设置文字
    [button setTitle:@"普通按钮" forState:UIControlStateNormal];
    [button setTitle:@"高亮按钮" forState:UIControlStateHighlighted];

    //1.5 设置文字颜色
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    //1.6 设置文件阴影颜色
    [button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    //1.7
    button.titleLabel.shadowOffset = CGSizeMake(3, 2);

    //1.8 设置内容图片
    [button setImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];

    //1.9 设置背景颜色
    [button setBackgroundImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateNormal];

    //1.10 添加监听的点击
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpOutside];
    [self.view addSubview:button];
}

- (void)click:(UIButton *)button {
    NSLog(@"按钮点击");
}

@end
