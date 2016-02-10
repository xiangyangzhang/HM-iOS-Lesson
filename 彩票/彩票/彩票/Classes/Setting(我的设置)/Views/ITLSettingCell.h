//
//  ITLSettingCell.h
//  
//
//  Created by 倪凡乐 on 16/2/6.
//
//

#import <UIKit/UIKit.h>
#import "ITLSettingItem.h"

@interface ITLSettingCell : UITableViewCell

@property (nonatomic, strong)ITLSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
