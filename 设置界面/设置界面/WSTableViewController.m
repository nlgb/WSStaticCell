//
//  WSTableViewController.m
//  设置界面
//
//  Created by sw on 16/3/20.
//  Copyright © 2016年 sw. All rights reserved.
//

#import "WSTableViewController.h"

@interface WSTableViewController ()
/** tableView的分组 */
@property(nonatomic,strong) NSArray *groups;
/** tableView的分组标题 */
@property(nonatomic,strong) NSArray *titles;

@end

@implementation WSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.sectionFooterHeight = 2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *group = [self.groups objectAtIndex:section];
    return group.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSArray *group = [self.groups objectAtIndex:indexPath.section];
    cell.textLabel.text = group[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titles[section];
}

#pragma mark - getter AND setter
- (NSArray *)groups
{
    if (!_groups) {
        NSArray *group1 = @[@"昵称",@"相册"];
        NSArray *group2 = @[@"钱包",@"活动",@"表情",@"通用"];
        NSArray *group3 = @[@"收藏",@"隐私与安全"];
        NSArray *group4 = @[@"设置"];
        
        NSArray *groups = @[group1,group2,group3,group4];
        _groups = groups;
    }
    return _groups;
}

- (NSArray *)titles
{
    if (!_titles) {
        self.titles = @[@"我的",@"功能",@"隐私",@"设置"];
    }
    return _titles;
}
@end
