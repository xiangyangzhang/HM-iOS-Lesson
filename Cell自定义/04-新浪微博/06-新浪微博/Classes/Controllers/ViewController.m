//
//  ViewController.m
//  06-新浪微博
//
//  Created by 倪凡乐 on 15/12/21.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLStatus.h"

@interface ViewController ()

@property (nonatomic, strong)NSArray *statuses;


@end

@implementation ViewController

- (NSArray *)statuses
{
    if (_statuses == nil) {
        _statuses = [NFLStatus statuses];
    }
    return _statuses;
}



# pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NFLStatus *statuses = self.statuses[indexPath.row];
    
    cell.textLabel.text = statuses.name;

    
    return cell;
}

@end
