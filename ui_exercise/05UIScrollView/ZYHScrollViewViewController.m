//
//  ZYHScrollViewViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/18.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHScrollViewViewController.h"

@interface ZYHScrollViewViewController () <UIScrollViewDelegate, UITextFieldDelegate>
@property(nonatomic, weak) NSTimer *nsTimer;
@end

@implementation ZYHScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] init];

    scrollView.frame = CGRectMake(0, 0, 300, 300);

    scrollView.backgroundColor = [UIColor redColor];

    //设置内容尺寸(滚动范围)
    scrollView.contentSize = CGSizeMake(400, 400);

    //设置能否滚动
    scrollView.scrollEnabled = YES;

    //是否能够跟用户交互
    scrollView.userInteractionEnabled = YES;

    //是否有弹簧效果
    scrollView.bounces = YES;

    //设置这个属性为 yes 才能使用下拉或者上拉刷新,只是有个弹簧效果
    scrollView.alwaysBounceHorizontal = NO;
    scrollView.alwaysBounceVertical = NO;

    //设置是否显示 滚动条
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = YES;

    //内容的偏移量,控制内容滚动的位置
    scrollView.contentOffset = CGPointMake(200, 100);

    //设置滚动的位置
    [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0) animated:YES];

    //设置内边距
    scrollView.contentInset = UIEdgeInsetsMake(10, 10, 20, 30);

    //设置代理
    scrollView.delegate = self;

    //设置缩放比例
    scrollView.maximumZoomScale = 10.0;
    scrollView.minimumZoomScale = 0.5;

    //开启分页功能 标准:以 scrollView 的宽度为一页
    scrollView.pagingEnabled = YES;

    //分页控件
    UIPageControl *uiPageControl = [[UIPageControl alloc] init];
    //一共有几页
    uiPageControl.numberOfPages = 5;
    //当前是几页
    uiPageControl.currentPage = 4;
    //隐藏控件
    uiPageControl.hidden = YES;
    //单页是否隐藏
    uiPageControl.hidesForSinglePage = YES;

//    [uiPageControl addTarget:self action:@selector() forControlEvents:<#(UIControlEvents)controlEvents#>];
    //设置pageControl的图片
    [uiPageControl setValue:[UIImage imageNamed:@"player_btn_pause_highlight"] forKeyPath:@"_currentPageImage"];
    [uiPageControl setValue:[UIImage imageNamed:@"player_btn_pause_highlight"] forKeyPath:@"_pageImage"];


}

/**
 * 返回需要缩放的子控件(scrollView 的子控件)
 * @param scrollView
 * @return
 */
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//    return imageview;
    return NULL;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];


}

#pragma mark - UIScrollViewDelegate

/**
 * 当 scrollView 正在滚动的时候就会自动调用这个方法
 *
 * @param scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScroll");
}

/**
 * 开始拖拽
 * @param scrollView
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}

/**
 * 即将拖拽结束
 * @param scrollView
 * @param velocity
 * @param targetContentOffset
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging");
}

/**
 * 拖拽结束
 * @param scrollView
 * @param decelerate
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");
    if (decelerate) {
        NSLog(@"用户已经停止拖拽 scrollView ,停止滚动");
    } else {
        NSLog(@"用户已经停止拖拽 scrollView ,但是 scrollView 由于惯性会继续滚动,减速");
    }
}

/**
 * 减速完毕会调用,停止滚动
 * @param scrollView
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollView 减速完毕会调用,停止滚动");
}

#pragma mark - UITextField UITextFieldDelegate

- (void)textField {
    //创建 UITextField
    UITextField *uiTextField = [[UITextField alloc] init];
    //通过 delegate 监听事件
    uiTextField.delegate = self;

    //通过 addTarget 监听点击
    [uiTextField addTarget:self action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventEditingDidBegin];


    //结束编辑,退出键盘
    [uiTextField endEditing:YES];
    [uiTextField resignFirstResponder];
    //最常用的方式
    [self.view endEditing:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"开始编辑");
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"结束编辑");
}

/**
 * 当 textField 文字改变就会调用这个方法
 * @param textField 用户输入文字
 * @param range
 * @param string
 * @return 控制输入是否被允许 YES:允许 NO:禁止用户输入
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {


    return YES;
}


#pragma mark - UISegmentedControl

- (void)testSegmentedControl {
    //UISegmentedControl
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"12", @"21212"]];
    [segmentedControl addTarget:self action:@selector(segmentedControlClick:) forControlEvents:UIControlEventValueChanged];
}

- (void)segmentedControlClick:(UISegmentedControl *)segmentedControl {

}


#pragma mark  - 定时器相关代码

- (void)startTimer {
    /**
     * userInfo : 传递参数
     */
    self.nsTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:@"123" repeats:YES];
    //作用:修改 timer 在 runloop 中的模式为 NSRunLoopCommonModes
    //目的:不管主线程在做什么操作,都会分配一定的时间处理定时器
    [[NSRunLoop currentRunLoop] addTimer:self.nsTimer forMode:NSRunLoopCommonModes];//界面追踪模式

}

- (void)stopTimer {
    [self.nsTimer invalidate];
    self.nsTimer = nil;
}

- (void)nextPage:(NSTimer *)timer {
    NSLog(@"%@", timer.userInfo);
}

@end
