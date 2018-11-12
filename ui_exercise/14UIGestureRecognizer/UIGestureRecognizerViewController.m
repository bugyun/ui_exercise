//
//  UIGestureRecognizerViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/11/8.
//  Copyright © 2018 finupgroup. All rights reserved.
//

#import "UIGestureRecognizerViewController.h"

@interface UIGestureRecognizerViewController () <UIGestureRecognizerDelegate>

@end

@implementation UIGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//设置点按手势
- (void)setTap {
    //1.创建点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    //设置代理
    tap.delegate = self;
    //2.添加手势
    [self.view addGestureRecognizer:tap];
}

//3.实现手势方法
- (void)tap:(id)tap {
    NSLog(@"%s", __func__);
}

//是否容许接受手指
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //让当前的图片左边不能点击,右边可以点击
    //获取当前手指的点
    CGPoint curP = [touch locationInView:self.view];
    if (curP.x > self.view.frame.size.width * 0.5) {
        //在左边
        return YES;
    } else {//在右边
        return NO;
    }
}

//设置长按手势
- (void)setLongPress {
    //创建长按手势
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];

    //添加手势
    [self.view addGestureRecognizer:longPressGestureRecognizer];
}

/**
 *  UIGestureRecognizerStatePossible,   // the recognizer has not yet recognized its gesture, but may be evaluating touch events. this is the default state

    UIGestureRecognizerStateBegan,      // the recognizer has received touches recognized as the gesture. the action method will be called at the next turn of the run loop
    UIGestureRecognizerStateChanged,    // the recognizer has received touches recognized as a change to the gesture. the action method will be called at the next turn of the run loop
    UIGestureRecognizerStateEnded,      // the recognizer has received touches recognized as the end of the gesture. the action method will be called at the next turn of the run loop and the recognizer will be reset to UIGestureRecognizerStatePossible
    UIGestureRecognizerStateCancelled,  // the recognizer has received touches resulting in the cancellation of the gesture. the action method will be called at the next turn of the run loop. the recognizer will be reset to UIGestureRecognizerStatePossible

    UIGestureRecognizerStateFailed,     // the recognizer has received a touch sequence that can not be recognized as the gesture. the action method will not be called and the recognizer will be reset to UIGestureRecognizerStatePossible

    // Discrete Gestures – gesture recognizers that recognize a discrete event but do not report changes (for example, a tap) do not transition through the Began and Changed states and can not fail or be cancelled
    UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded
 */
- (void)longP:(UILongPressGestureRecognizer *)longP {
    NSLog(@"%s", __func__);
    //判断手势的状态
    switch (longP.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:
            break;
        case UIGestureRecognizerStateEnded:
            break;
        default:
            break;
    }
}

- (void)setSwipe {
    //1.
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //设置轻扫的方向(一个手势只能对应一个方向)
    /**
     *  UISwipeGestureRecognizerDirectionRight = 1 << 0,
        UISwipeGestureRecognizerDirectionLeft  = 1 << 1,
        UISwipeGestureRecognizerDirectionUp    = 1 << 2,
        UISwipeGestureRecognizerDirectionDown  = 1 << 3
     */
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;

    [self.view addGestureRecognizer:swipeGestureRecognizer];

}

- (void)swipe:(UISwipeGestureRecognizer *)swipe {
    NSLog(@"%s", __func__);
    switch (swipe.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            break;
        case UISwipeGestureRecognizerDirectionRight:
            break;
        default:
            break;
    }
}


@end
