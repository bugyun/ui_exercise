//
//  AppDelegate.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/8.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@property(strong, nonatomic) UIWindow *window1;
@end

@implementation AppDelegate

//应用程序启动完毕时调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"%s", __func__);

    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor blueColor];
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor redColor];
    window.rootViewController = viewController;
    NSLog(@"%@", [UIApplication sharedApplication].keyWindow);
    [window makeKeyAndVisible];
    NSLog(@"%@", [UIApplication sharedApplication].keyWindow);
    _window = window;

    //从 ios9之后,如果添加了多个窗口,控制器会自动把状态栏隐藏掉.
    //解决方法:把状态栏给应用程序管理
    _window1 = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    UIViewController *viewController1 = [[UIViewController alloc] init];
    viewController1.view.backgroundColor = [UIColor orangeColor];
    _window1.rootViewController = viewController1;
    [_window1 makeKeyAndVisible];

    //设置窗口的层级
    _window1.windowLevel = UIWindowLevelNormal;
    _window.windowLevel = UIWindowLevelNormal;
    /**层级
     * UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal
     */


    //通过 storyboard 加载控制器
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //加载箭头所指向的 storyboard
    UIViewController *viewController2 = [storyboard instantiateInitialViewController];
    //加载指定的 storyboard
    //viewController2 = [storyboard instantiateViewControllerWithIdentifier:@"vc"];
    window.rootViewController = viewController2;

    //通过 xib 加载控制器
    //UIViewController *uiViewController = [[UIViewController alloc] initWithNibName:@"One" bundle:nil];

//    ViewController *viewController3 = [[ViewController alloc] init];
//    window.rootViewController = viewController3;

    return YES;
}

//应用程序将要失去焦点时调用
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s", __func__);
}

//应用程序进入到后台时调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%s", __func__);
}

//应用程序进入到前台时调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s", __func__);
}

//应用程序获取焦点时调用
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s", __func__);
}

//应用程序退出时调用
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s", __func__);
}

//当应用程序收到内存警告时调用
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    NSLog(@"%s", __func__);
}


@end
