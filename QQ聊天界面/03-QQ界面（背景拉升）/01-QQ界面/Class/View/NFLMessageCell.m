//
//  NFLMessageCell.m
//  
//
//  Created by 倪凡乐 on 16/1/1.
//
//

#import "NFLMessageCell.h"
#import "NFLMessageFrame.h"
#import "NFLMessage.h"
#import "Constant.h"

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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.时间
        UILabel *time = [[UILabel alloc]init];
        time.textAlignment = NSTextAlignmentCenter;
        time.font = kTimeFont;
        [self.contentView addSubview:time];
        self.timeLabel = time;
        
        //2.正文
        UIButton *textView = [[UIButton alloc]init];
        //textView.backgroundColor = [UIColor grayColor];
        textView.titleLabel.font = kButtonFont;
        //自动换行
        textView.titleLabel.numberOfLines = 0;
        //设置按钮内边距
        textView.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        [textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:textView];
        self.textButton = textView;
        
        //3.头像
        UIImageView *icon = [[UIImageView alloc]init];
        [self.contentView addSubview:icon];
        self.iconView = icon;
        
        //单元格背景设为透明
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

- (void)setMessageFrame:(NFLMessageFrame *)messageFrame
{
    _messageFrame = messageFrame;
    
    NFLMessage *frame = messageFrame.message;
    
    //时间,设置大小位置和内容
    self.timeLabel.frame = messageFrame.timeF;
    self.timeLabel.text = frame.time;
    
    //头像,设置大小位置和内容
    self.iconView.frame = messageFrame.iconF;
    if (frame.type == NFLMessagTypeGatsby) {
        self.iconView.image = [UIImage imageNamed:@"Gatsby"];
    }else{
        self.iconView.image = [UIImage imageNamed:@"Jobs"];
    }
    
    //正文,设置大小位置和内容
    self.textButton.frame = messageFrame.textViewF;
    [self.textButton setTitle:frame.text forState:UIControlStateNormal];
    //设置聊天正文背景
    if (frame.type == NFLMessagTypeGatsby) {
        [self.textButton setBackgroundImage:[self resizeWithImageName:@"chat_send_nor"] forState:UIControlStateNormal];
    }else{
        [self.textButton setBackgroundImage:[self resizeWithImageName:@"chat_recive_nor"] forState:UIControlStateNormal];
    }
        
    
}


//返回一个可拉伸图片
- (UIImage *)resizeWithImageName:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    
    //拉伸最中间的那个小方块
    CGFloat w = normal.size.width * 0.5-1;
    CGFloat h = normal.size.height * 0.5-1;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
