//
//  NFLMessageCell.h
//  
//
//  Created by 倪凡乐 on 16/1/1.
//
//

#import <UIKit/UIKit.h>

@class NFLMessageFrame;

@interface NFLMessageCell : UITableViewCell


+(instancetype)messageCellWithTableView:(UITableView *)tableView;

//frame模型
@property (nonatomic, strong)NFLMessageFrame *messageFrame;

@end
