//
//  ZYHKVCViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/18.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHKVCViewController.h"
#import "ZYHPerson.h"

@interface ZYHKVCViewController ()

@end

@implementation ZYHKVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    ZYHPerson *person = [[ZYHPerson alloc] init];
    //kvc 赋值
    /**
     * forKey 与 forKeyPath 的区别:
     * 1.forKeyPath 包含了 forKey 的功能
     * 2.forKeyPath 进行内部的点语法,层层访问内部的属性
     * 3.注意: key 值一定要在属性中找到
     */
    [person setValue:@"张" forKey:@"name"];
    [person setValue:@"12" forKeyPath:@"money"];//自动类型转换
    //[person setValue:@"12" forKeyPath:@"dog.money"];//自动类型转换
    NSLog(@"%@------%f", person.name, person.money);
//    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

}

@end
