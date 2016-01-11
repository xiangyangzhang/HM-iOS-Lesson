//
//  NFLHeaderView.h
//  
//
//  Created by 倪凡乐 on 16/1/6.
//
//

#import <UIKit/UIKit.h>

@class NFLHeaderView;

//block1,语义化block名称
typedef void(^NFLHeaderViewBlock)(id);


@protocol NFLHeaderViewDelegate <NSObject>

@optional
- (void)headerViewIsOpen:(NFLHeaderView *)view;

@end

@class NFLFriendsGroupModel;

@interface NFLHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWith:(UITableView *)tableView;

@property (nonatomic, assign)id<NFLHeaderViewDelegate> delegate;

@property (nonatomic, strong)NFLFriendsGroupModel *group;

//block2，声明block
@property (nonatomic, copy)NFLHeaderViewBlock block;


@end
