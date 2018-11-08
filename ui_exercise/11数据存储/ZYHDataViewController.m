//
//  ZYHDataViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/11/6.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHDataViewController.h"
#import "ZYHCar.h"

@interface ZYHDataViewController ()

@end

@implementation ZYHDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", NSHomeDirectory());//沙盒路径

    /**
     第一个参数:搜索的目录
     第二个参数:搜索的范围
     第三个参数:是否展开路径(在 ios 当中不识别~,所以必须 YES)
     */
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@", path);// ~/Documents
    //拼接文件路径
    NSString *filePath = [path stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"%@", filePath);

    //把数组保存到沙盒里面
    NSArray *dataArray = @[@"zyh", @10];
    [dataArray writeToFile:filePath atomically:YES];

    NSString *dictFilePath = [path stringByAppendingPathComponent:@"dict.plist"];
    NSDictionary *dict = @{@"name": @"zyh", @"age": @21};
    [dict writeToFile:dictFilePath atomically:YES];

    //读取数据
    NSLog(@"%@", [NSArray arrayWithContentsOfFile:filePath]);
    NSLog(@"%@", [NSDictionary dictionaryWithContentsOfFile:dictFilePath]);

}

- (void)preference {
    //NSUserDefaults 保存的也是一个 plist
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //存储
    [defaults setObject:@"zyh" forKey:@"name"];
    [defaults setInteger:10 forKey:@"age"];
    //立马写入到文件中
    [defaults synchronize];


    //读取
    NSString *name = [defaults objectForKey:@"name"];
    NSLog(@"%@", name);
    NSInteger age = [defaults integerForKey:@"age"];
    NSLog(@"%ld", age);
}

- (void)nskeyedarchiver {

    ZYHCar *car = [[ZYHCar alloc] init];
    car.icon = @"12121";
    car.name = @"zyh";

    //获取沙盒目录
    NSString *tempPath = NSTemporaryDirectory();
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"Person.data"];
    //归档
    [NSKeyedArchiver archiveRootObject:car toFile:filePath];

    //解档
    ZYHCar *otherCar = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@", otherCar);

}


@end
