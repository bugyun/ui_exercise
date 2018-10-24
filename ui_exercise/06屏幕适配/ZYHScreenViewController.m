//
//  ZYHScreenViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/22.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHScreenViewController.h"

@interface ZYHScreenViewController ()

@end

@implementation ZYHScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    CGFloat X = self.view.frame.size.width - 100;
    CGFloat Y = self.view.frame.size.height - 100;
    redView.frame = CGRectMake(X, Y, 100, 100);

    /**
     *  UIViewAutoresizingNone                 = 0,
        UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,距离父控件的左边是可以伸缩的
        UIViewAutoresizingFlexibleRightMargin  = 1 << 2,距离父控件的右边是可以伸缩的
        UIViewAutoresizingFlexibleTopMargin    = 1 << 3,距离父控件的顶部是可以伸缩的
        UIViewAutoresizingFlexibleBottomMargin = 1 << 5,距离父控件的底部是可以伸缩的

        UIViewAutoresizingFlexibleWidth        = 1 << 1,宽度会跟随父控件进行伸缩
        UIViewAutoresizingFlexibleHeight       = 1 << 4,高度会跟随父控件进行伸缩
     */
    redView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:redView];


}


@end
