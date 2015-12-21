//
//  NFLGroupBuysCellTableViewCell.h
//  
//
//  Created by 倪凡乐 on 15/12/18.
//
//

#import <UIKit/UIKit.h>

@class NFLGroupBuys;

@interface NFLGroupBuysCellTableViewCell : UITableViewCell
//定义团购数据模型
@property (strong, nonatomic)NFLGroupBuys *groupBuys;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
