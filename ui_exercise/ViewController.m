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

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 200, 200);
    button.backgroundColor = [UIColor redColor];
//    [button setBackgroundImage:<#(nullable UIImage *)image#> forState:UIControlStateNormal];
    [button setTitle:@"你好" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchDown];
}

#pragma mark - 测试

- (void)test {
    NSLog(@"执行");
}

#pragma mark - 测试1


@end
