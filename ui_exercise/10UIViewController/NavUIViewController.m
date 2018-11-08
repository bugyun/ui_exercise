//
//  NavUIViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/11/2.
//  Copyright © 2018 finupgroup. All rights reserved.
//

#import "NavUIViewController.h"

@interface NavUIViewController ()

@end

@implementation NavUIViewController

//控制器加载完毕调用
- (void)viewDidLoad {
    [super viewDidLoad];

}

//当控制器的 view 即将显示的时候调用
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

//当控制器的 view 显示完毕时调用
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

//当控制器的 view将要布局子控件的时候调用
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

}

//当控制器 view 布局子控完毕调用
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

//当控制器的 view 即将消失时调用
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

//当控制器的 view 已经消失的时候调用
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


- (void)test {
    [UIApplication sharedApplication].keyWindow;
    UIImage *image = [UIImage imageNamed:@""];
    //原图,不进行处理
    UIImage *oriImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender {



}
@end
