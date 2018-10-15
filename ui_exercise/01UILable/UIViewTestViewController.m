//
//  UIViewTestViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/9.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "UIViewTestViewController.h"

@interface UIViewTestViewController ()

@end

@implementation UIViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view viewWithTag:1];

    UIView *readView = [[UIView alloc] init];
    [self.view addSubview:readView];

    //
    UISwitch *sw = [[UISwitch alloc] init];
    [self.view addSubview:sw];

    UISwitch *sw1 = [[UISwitch alloc] init];

    [readView addSubview:sw1];

    UISegmentedControl *sg = [[UISegmentedControl alloc] initWithItems:@[@"haha"]];

    [readView addSubview:sg];

    [self.view removeFromSuperview];


    UITextField *textField = [[UITextField alloc] init];
    textField.keyboardType = UIKeyboardTypeNumberPad;


    NSInteger sum = [textField.text integerValue];


}


@end
