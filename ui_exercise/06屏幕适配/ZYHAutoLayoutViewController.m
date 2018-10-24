//
//  ZYHAutoLayoutViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/23.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHAutoLayoutViewController.h"

@interface ZYHAutoLayoutViewController ()

@end

@implementation ZYHAutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建 view
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor =[UIColor redColor];
    [self.view addSubview:redView];
    
    //添加约束
    //禁止 autoresizing 自动转为约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    //添加宽度约束
    /**
     view1 ：要约束的控件
     attr1 ：约束的类型（做怎样的约束）
     relation ：与参照控件之间的关系
     view2 ：参照的控件
     attr2 ：约束的类型（做怎样的约束）
     multiplier ：乘数
     c ：常量
     */
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [redView addConstraint:right];
    
//H:[cancelButton(72)]-12-[acceptButton(50)]
//    canelButton宽72，acceptButton宽50，它们之间间距12
//
//H:[wideView(>=60@700)]
//    wideView宽度大于等于60point，该约束条件优先级为700（优先级最大值为1000，优先级越高的约束越先被满足）
//
//V:[redBox][yellowBox(==redBox)]
//    竖直方向上，先有一个redBox，其下方紧接一个高度等于redBox高度的yellowBox
//
//H:|-10-[Find]-[FindNext]-[FindField(>=20)]-|
//    水平方向上，Find距离父view左边缘默认间隔宽度，之后是FindNext距离Find间隔默认宽度；再之后是宽度不小于20的FindField，它和FindNext以及父view右边缘的间距都是默认宽度。（竖线“|” 表示superview的边缘）
    
    
    NSString *hlcs = @"H:|-space-[redView]-space-|";
    NSDictionary *views = @{@"redView":redView};
    NSDictionary *metrics = @{@"space":@20};
    
    
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:hlcs options:kNilOptions metrics:metrics views:views]];
    
    //快速创建 以值为键的集合
    NSDictionary *d = NSDictionaryOfVariableBindings(redView);
    
    

    
}
@end
