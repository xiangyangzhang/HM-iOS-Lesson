//
//  NFLMessageCell.m
//  
//
//  Created by 倪凡乐 on 16/1/1.
//
//

#import "NFLMessageCell.h"
#import "NFLMessage.h"

@interface NFLMessageCell()
//时间
@property (nonatomic, strong)UILabel *timeLabel;
//头像
@property (nonatomic, strong)UIImageView *iconView;
//正文
@property (nonatomic, strong)UIButton *textButton;


@end

@implementation NFLMessageCell

+ (instancetype)messageCellWithTableView:(UITableView *)tableView
{
    static NSString *ID =@"Cell";
    
    NFLMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NFLMessageCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
