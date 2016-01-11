//
//  NFLHeaderView.h
//  
//
//  Created by 倪凡乐 on 16/1/6.
//
//

#import <UIKit/UIKit.h>

@class NFLHeaderView;

@protocol NFLHeaderViewDelegate <NSObject>

@optional
- (void)headerViewIsOpen:(NFLHeaderView *)view;

@end

@class NFLFriendsGroupModel;

@interface NFLHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWith:(UITableView *)tableView;

@property (nonatomic, assign)id<NFLHeaderViewDelegate> delegate;

@property (nonatomic, strong)NFLFriendsGroupModel *group;

@end
