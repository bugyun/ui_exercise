//
//  MyPerson.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/30.
//  Copyright © 2018 finupgroup. All rights reserved.
//

#import "MyPerson.h"

@implementation MyPerson

static MyPerson *_instance;

/**
 * 1.程序一运行,就创建对象
 * 什么时候调用:当类加载到内存当中就会调用
 */
+ (void)load {
    NSLog(@"%s", __func__);
    _instance = [[MyPerson alloc] init];
}

+ (instancetype)sharedPerson {
    return _instance;
}

+ (instancetype)alloc {
    if (_instance) {
        //创建异常
        NSException *exc = [NSException exceptionWithName:@"错误" reason:@"MyPerson只能创建一次对象" userInfo:nil];
        [exc raise];//抛出异常
    }
    return [super alloc];
}


@end
