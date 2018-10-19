//
//  PListViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/15.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "PListViewController.h"

@interface PListViewController ()

@end

@implementation PListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSArray *names = @[@"ni", @"1", @"2"];
    BOOL flag = [names writeToFile:@"" atomically:YES];
    if (flag) {
        NSLog(@"写入成功");
    }

    //获取 plist 文件的全路径
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"shops" ofType:@"plist"];
    //加载 plist 文件
    NSArray *shop = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"%@", shop);

}


@end
