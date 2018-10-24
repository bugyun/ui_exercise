//
//  ZYHTableViewViewController.m
//  ui_exercise
//
//  Created by 若云 on 2018/10/24.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "ZYHTableViewViewController.h"

@interface ZYHTableViewViewController () //<UITableViewDataSource>

@end

@implementation ZYHTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     * 设置显示
     *  UITableViewStylePlain,          // regular table view
        UITableViewStyleGrouped         // preferences style table view
     */
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStyleGrouped];


//    tableView.dataSource = self;


}


#pragma  mark  - UITableViewDataSource

/**
 * 有几种数据
 * @param tableView
 * @return
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

/**
 * 每组里面有几个数据
 * @param tableView
 * @param section
 * @return
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
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
    cell.textLabel.text = @"textLabel";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li组,%li行%@", indexPath.section, indexPath.row, @"..."];
    indexPath.section;//第几组
    indexPath.row;//第几行

    return cell;
}

@end
