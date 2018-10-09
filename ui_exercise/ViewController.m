//
//  ViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/8.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//私有属性


@end

@implementation ViewController

/**
 * 1.系统调用
 * 2.控制器的 view 加载完毕的时候调用
 * 3.控件的初始化，数据的初始化（懒加载）
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 200, 200);
    button.backgroundColor = [UIColor redColor];
//    [button setBackgroundImage:(nullable UIImage *)image forState:UIControlStateNormal];
    [button setTitle:@"你好" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchDown];

//    [self.view removeFromSuperview];
}


- (void)loadView {

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

#pragma mark - 测试

- (void)test {
    NSLog(@"执行");
}

#pragma mark - 测试1


/**
 * 1.系统调用
 * 2.当控制器接收到内存警告调用
 * 3.去除一些不必要的内存，去除耗时的内存
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
