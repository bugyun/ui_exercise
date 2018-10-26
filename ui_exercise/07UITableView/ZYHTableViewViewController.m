//
//  ZYHTableViewViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/24.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHTableViewViewController.h"
#import "ZYHCarGroup.h"
#import "ZYHCar.h"
#import "ZYHTableViewCell.h"

@interface ZYHTableViewViewController ()//<UITableViewDelegate> //<UITableViewDataSource>

@property(nonatomic, strong) NSArray *carGroups;
@end

@implementation ZYHTableViewViewController


- (NSArray *)carGroups {
    if (_carGroups == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            ZYHCarGroup *group = [ZYHCarGroup carGroupWithDic:dict];
            [temp addObject:group];
        }
        _carGroups = temp;
        NSLog(@"%@", _carGroups);
    }
    return _carGroups;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     * 设置显示
     *  UITableViewStylePlain,          // regular table view
        UITableViewStyleGrouped         // preferences style table view
     */
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStyleGrouped];
//    tableView.dataSource = self;

    //设置 tableView 每一行 cell 的高度
    self.tableView.rowHeight = 100;
    //设置 tableView 每一组头部的高度
    self.tableView.sectionFooterHeight = 40;
    //设置 tableView 每一组底部的高度
    self.tableView.sectionHeaderHeight = 40;
    //分割线颜色
    self.tableView.separatorColor = [UIColor redColor];
    /**
     *  UITableViewCellSeparatorStyleNone,不显示分割线
        UITableViewCellSeparatorStyleSingleLine,单行分割线
        UITableViewCellSeparatorStyleSingleLineEtched  group,情况下使用,单行分割线
     */
    //设置分割线的样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    //设置 tableView 整体的头部 view
    self.tableView.tableHeaderView = [[UISwitch alloc] init];
    //设置 tableView 整体的底部 view
//    self.tableView.tableFooterView = [[UISwitch alloc] init];

    //plain 模式下,不显示多余的 line ,
    self.tableView.tableFooterView = [[UIView alloc] init];
    //根据 id 注册对应的 cell 类型为 UITableViewCell
    [self.tableView registerClass:[ZYHTableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

#pragma  mark  - UITableViewDataSource

/**
 * 有几种数据
 * @param tableView
 * @return
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carGroups.count;
}

/**
 * 每组里面有几个数据
 * @param tableView
 * @param section
 * @return
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZYHCarGroup *group = self.carGroups[(NSUInteger) section];
    return group.cars.count;
}

/**
 * 每当一个 cell 进入视野范围内就会调用一次
 * @param tableView
 * @param indexPath
 *      indexPath.section;//第几组
        indexPath.row;//第几行
 * @return
 */
//0.定义一个重用标识
static NSString *cellIdentifier = @"NotesCell";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.去缓存池中取可以循环利用的 cell
    ZYHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //2.如果缓存池中没有可循环利用的 cell,自己创建
    if (cell == nil) {
        cell = [[ZYHTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    ZYHCarGroup *group = self.carGroups[indexPath.section];
    ZYHCar *car = group.cars[indexPath.row];
//    cell.textLabel.text = car.name;
//    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li组,%li行%@", indexPath.section, indexPath.row, @"..."];
    indexPath.section;//第几组
    indexPath.row;//第几行

    [cell setCar:car];

    //设置 cell 右边显示的样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //设置 cell 右边显示的控件 ,优先级大于 accessoryType
    cell.accessoryView = [[UISwitch alloc] init];

    /**
     * 设置选中的状态 ,ios7以后 都是灰色
     * UITableViewCellSelectionStyleNone,
        UITableViewCellSelectionStyleBlue, 灰色
        UITableViewCellSelectionStyleGray, 灰色
        UITableViewCellSelectionStyleDefault 灰色
     */
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;

    //设置 cell 选中的背景 view
    UIView *sbg = [[UIView alloc] init];
    sbg.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = sbg;

    //设置 cell 的背景色
    cell.backgroundColor = [UIColor redColor];

    //设置 cell 的背景 view
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor blueColor];
    cell.backgroundView = bg;

    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    ZYHCarGroup *group = self.carGroups[section];
    return group.header;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    ZYHCarGroup *group = self.carGroups[section];
    return group.footer;
}

- (void)test {
    //设置索引条文字的颜色
    self.tableView.sectionIndexColor = [UIColor redColor];
    //设置索引条背景的颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor yellowColor];
}

//索引条
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    //抽取
    return [self.carGroups valueForKeyPath:@"header"];
}

//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
//
//}


#pragma  mark - UITableViewDelegate

//选中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了:%ld", indexPath.row);
}

//取消选中某一行
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消选中了:%ld", indexPath.row);
}

//每个 group 的头部
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}

//每个 group 的底部
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}

//返回 每个 group 的头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

//返回 每个 group 的头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50;
}

//每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
@end
