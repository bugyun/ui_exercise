//
//  UIAppViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/30.
//  Copyright © 2018 finupgroup. All rights reserved.
//

#import "UIAppViewController.h"
#import "MyPerson.h"

@interface UIAppViewController ()

@end

@implementation UIAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [UIApplication sharedApplication];

    MyPerson *myPerson = [MyPerson sharedPerson];

    //设置提醒图标
    //1.获取 UIApplication 对象
    UIApplication *application = [UIApplication sharedApplication];
    //2.注册用户通知
    UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [application registerUserNotificationSettings:notificationSettings];
    //3.设置提醒值
    application.applicationIconBadgeNumber = 10;


    //设置联网状态
    //UIApplication *application = [UIApplication sharedApplication];
    application.networkActivityIndicatorVisible = YES;



    //状态栏
    application.statusBarHidden = YES;
    application.statusBarStyle = UIStatusBarStyleDefault;
    [application setStatusBarHidden:YES animated:YES];

    //打电话
    [application openURL:[NSURL URLWithString:@"tel://10086"]];
    //发短信
    NSDictionary *dictionary = @{};
    [application openURL:[NSURL URLWithString:@"sms://10086"] options:dictionary completionHandler:^(BOOL success) {

    }];
    //发邮件
    [application openURL:[NSURL URLWithString:@"mailto://10086"]];
    //打开一个网页资源
    [application openURL:[NSURL URLWithString:@"http://www.baidu.com"]];





}

#pragma  mark - 设置状态栏

//状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

//状态栏是否隐藏
- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end
