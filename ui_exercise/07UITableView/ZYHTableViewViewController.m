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

@interface ZYHTableViewViewController () //<UITableViewDataSource>

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
    self.tableView.tableFooterView = [[UISwitch alloc] init];


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
 *
 * @param tableView
 * @param indexPath
 *      indexPath.section;//第几组
        indexPath.row;//第几行
 * @return
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"NotesCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    ZYHCarGroup *group = self.carGroups[indexPath.section];
    ZYHCar *car = group.cars[indexPath.row];
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li组,%li行%@", indexPath.section, indexPath.row, @"..."];
    indexPath.section;//第几组
    indexPath.row;//第几行

    //设置 cell 右边显示的控件 ,优先级大于 accessoryType
    cell.accessoryView = [[UISwitch alloc] init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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


@end
