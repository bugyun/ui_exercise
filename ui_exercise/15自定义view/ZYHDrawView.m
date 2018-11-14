//
//  ZYHDrawView.m
//  ui_exercise
//
//  Created by 若云 on 2018/11/12.
//  Copyright © 2018 finupgroup. All rights reserved.
//

#import "ZYHDrawView.h"

@implementation ZYHDrawView

//仅drawRect:如果您执行自定义绘图。
//空的实现会对动画的性能产生负面影响。
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"%s", __func__);
    NSLog(@"%@", NSStringFromCGRect(rect));

    //在 drawRect 方法当中系统已经帮你创建一个跟 view 相关联的上下文(Layer上下文)
    //只要获取上下文就行了

    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //2.1设置起点
    [path moveToPoint:CGPointMake(50, 280)];
    //2.2添加一根线到终点
    [path addLineToPoint:CGPointMake(280, 50)];
    //上下文的状态:
    // 线的宽度
    CGContextSetLineWidth(ctx, 10);
    //设置线的连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    //设置线的顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //设置颜色
    [[UIColor redColor] setStroke];//

    //3.把绘制的内容保存到上下文当中.
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文的内容显示到 view 上(渲染到 view 的 layer)(stroke fill)
    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);

    //简单写法
    //[self simple];
    [self setNeedsDisplay];
}

//简单写法
- (void)simple {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 50)];
    [path stroke];
    //[path stroke]底层:1.获取上下文->2.描述路径->3.把路径添加到上下->4.把上下文的内容渲染 view 上
}

@end
