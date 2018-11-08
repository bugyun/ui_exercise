//
//  ZYHTransformViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/11/7.
//  Copyright © 2018 finupgroup. All rights reserved.
//

#import "ZYHTransformViewController.h"

@interface ZYHTransformViewController ()

@end

@implementation ZYHTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor redColor];
    imageView.frame = CGRectMake(100, 100, 100, 100);
    imageView.userInteractionEnabled = YES;

    //平移操作
    [UIView animateWithDuration:0.5 animations:^{
        //使用 make ,它是相对最原始的位置做的形变
        imageView.transform = CGAffineTransformMakeTranslation(0, -100);

        //相对于上一次做形变
        imageView.transform = CGAffineTransformTranslate(imageView.transform, 0, -100);
    }];
    //旋转操作
    [UIView animateWithDuration:0.5 animations:^{
        //使用 make ,它是相对最原始的位置做的形变
        imageView.transform = CGAffineTransformMakeRotation(M_PI_4);

        //相对于上一次做形变
        imageView.transform = CGAffineTransformRotate(imageView.transform, M_PI_4);
    }];
    //缩放
    [UIView animateWithDuration:0.5 animations:^{
        //使用 make ,它是相对最原始的位置做的形变
        imageView.transform = CGAffineTransformMakeScale(1.2, 1);

        //相对于上一次做形变
        imageView.transform = CGAffineTransformScale(imageView.transform, 1, 0.7);
    }];

}

@end
