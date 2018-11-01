//
//  ZYHUIPickViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/31.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHUIPickViewController.h"

@interface ZYHUIPickViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ZYHUIPickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    
    
    
}

#pragma mark - UIPickerViewDataSource
// 总共有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

// 每一列,有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 5;
}

#pragma mark - UIPickerViewDelegate

//每一列的宽度
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
//
//}
////每一行的高度
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
//}

//每一行展示的内容
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%ld,%ld",component,row];
}

//每行展示什么内容,带有属性的字符串(大小,颜色,阴影,描边)
//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
//}
//每一行展示的视图
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
    
}
//当前选中的是哪一列哪一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"didSelect, component=%ld -- row-%ld",component,row);
}

@end
