//
//  ViewController.m
//  04-汽车品牌
//
//  Created by 倪凡乐 on 15/12/14.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLCarGroup.h"
#import "NFLCar.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong)NSArray *carGroups;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (NSArray *)carGroups
{
    if (_carGroups == nil) {
        _carGroups = [NFLCarGroup carGroup];
    }
    return _carGroups;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self tableView];
    
    NSLog(@"%@",self.carGroups);

    
}

# pragma mark - 代理方法
//分组总数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

//每一组总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NFLCarGroup *group = self.carGroups[section];
    
    return group.cars.count;
}

//单元格明细
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //可重用标示符
    static NSString *ID = @"cell";
    
    //让表哥缓存区查找可重用cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //设置cell内容
    //1> 取出数据模型
    NFLCarGroup *group = self.carGroups[indexPath.section];
    NFLCar *car = group.cars[indexPath.row];
    
    //2> 设置数据
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    return cell;
    
}

//分组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //找到group
    NFLCarGroup *group = self.carGroups[section];
    return group.title;
}

//右侧索引，与内容无关，与变量下标有关
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
//    NSMutableArray *arrayM = [NSMutableArray array];
//    for (NFLCarGroup *group in self.carGroups) {
//        [arrayM addObject:group.title];
//    }
//    return  arrayM;
    
    //KVC间接获取或修改对象属性
    //如KVC指定对象不包含valueForKeyPath的键值，则自动进入对象内部查找
    //如果对象是一个数组，则返回也是数组
    
    NSArray *array = [self.carGroups valueForKeyPath:@"cars.name"];
    NSLog(@"%@",array);
    
    return [self.carGroups valueForKeyPath:@"title"];
}

@end
