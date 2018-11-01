//
//  main.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/8.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char *argv[]) {
    @autoreleasepool {
        /**
         * 第一个参数:
         * 第二个参数:
         * 第三个参数:设置是应用程序对象的名称 UIApplication 或者是它的子.如果是 nil,默认是 UIApplication
         * 第四个参数:NSStringFromClass 将类名转为字符串
         */
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
