//
//  UIImageViewViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/9.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "UIImageViewViewController.h"

@interface UIImageViewViewController ()

@end

@implementation UIImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.1 创建 UIImageView 对象
    UIImageView *imageView = [[UIImageView alloc] init];

    //1.2 设置 frame
    imageView.frame = CGRectMake(100, 100, 200, 200);

    //1.3 设置背景
    imageView.backgroundColor = [UIColor redColor];

    //1.4 设置图片(png 不需要后缀)
    imageView.image = [UIImage imageNamed:@"buttongreen"];

    //1.5 设置图片的内容模式
    /**
     *  UIViewContentModeScaleToFill,带有 scale ,表示图片有可能被拉伸或压缩
     *
     *  Aspect 比例,缩放是带有比例的.
        UIViewContentModeScaleAspectFit,//以最长的一边压缩
        UIViewContentModeScaleAspectFill,//以最短的一边压缩,会裁剪

        UIViewContentModeRedraw, 重新绘制(核心绘图) drawRact

        不带有 Scale ,表明图片不可能被拉伸或压缩
        UIViewContentModeCenter,
        UIViewContentModeTop,
        UIViewContentModeBottom,
        UIViewContentModeLeft,
        UIViewContentModeRight,
        UIViewContentModeTopLeft,
        UIViewContentModeTopRight,
        UIViewContentModeBottomLeft,
        UIViewContentModeBottomRight,
     */
    imageView.contentMode = UIViewContentModeScaleToFill;

    //1.6 裁剪多余部分,默认 NO
    imageView.clipsToBounds = YES;

    //2.0 加到控制器的 view 中
    [self.view addSubview:imageView];
}

- (void)toolbar {
    //1.0 创建 UIImageView 对象
    UIImageView *uiImageView = [[UIImageView alloc] init];

    //1.1 设置尺寸 frame
    uiImageView.frame = CGRectMake(100, 100, 200, 200);

    uiImageView.image = [UIImage imageNamed:@"buttongreen"];

    uiImageView.contentMode = UIViewContentModeScaleAspectFill;

    //2. 添加毛玻璃
    //2.1 创建 UIToolbar
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    //2.2 设置 toolbar的 frame
    toolbar.frame = uiImageView.bounds;
    //2.3 设置毛玻璃的样式
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.alpha = 0.9;
    //2.4 加到 UIImageView 中
    [uiImageView addSubview:toolbar];

    //3.0 加到控制器的 view 中
    [self.view addSubview:uiImageView];
}

//图片的设置方式
- (void)imageview {
    //1.1 创建 UIImageView 对象
    UIImageView *imageView = [[UIImageView alloc] init];

    //方式一
    imageView.image = [UIImage imageNamed:@"buttongreen"];

    //方式二
    NSString *path = [[NSBundle mainBundle] pathForResource:@"buttongreen" ofType:@"png"];
    imageView.image = [UIImage imageWithContentsOfFile:path];

    [UIColor colorWithRed:(255 / 255.f) green:(255 / 255.f) blue:(255 / 255.f) alpha:1];


}

@end
