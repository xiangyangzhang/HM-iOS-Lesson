//
//  NFLHeaderView.m
//  
//
//  Created by 倪凡乐 on 16/1/6.
//
//

#import "NFLHeaderView.h"
#import "NFLFriendsGroupModel.h"

@interface NFLHeaderView()

@property (nonatomic, strong)UIButton *headerNameButton;
@property (nonatomic, strong)UILabel *headerTextlabel;


@end

@implementation NFLHeaderView

+ (instancetype)headerViewWith:(UITableView *)tableView
{
    NSString *ID = @"friendHeader";
    
    NFLHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (header == nil) {
        header = [[NFLHeaderView alloc]initWithReuseIdentifier:ID];
    }
    
    return header;
}

//当headerView上子控件只需做一次操作或者要显示出来，写在此方法中
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        //custom相当于 [[UIButton alloc]init]
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage: [UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        //设置按钮内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置按钮左边距
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置按钮文字左边距，控制与按钮上的imageView的距离
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(nameButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        self.headerNameButton = button;
        
        UILabel *label = [[UILabel alloc]init];
        label.textColor = [UIColor blackColor];
        //标签居右显示
        label.textAlignment =NSTextAlignmentRight;
        
        [self addSubview:label];
        self.headerTextlabel = label;
    }
    return self;
}


- (void)setGroup:(NFLFriendsGroupModel *)group
{
    _group = group;
    
    [self.headerNameButton setTitle:group.name forState:UIControlStateNormal];
    
    //显示在线人数
    self.headerTextlabel.text =  [NSString stringWithFormat:@"%d/%lu",group.online,(unsigned long)group.friends.count];
    
}


/**
 *  当前view的frame发生变化时，调用此方法，重新布局
 */
- (void)layoutSubviews
{
    self.headerNameButton.frame = self.bounds;
    CGFloat groupTextH = self.frame.size.height;
    CGFloat groupTextW = 150;
    CGFloat groupTextX = self.frame.size.width -groupTextW -10;
    CGFloat groupTextY = 0;
    self.headerTextlabel.frame =  CGRectMake(groupTextX, groupTextY, groupTextW, groupTextH);

}

- (void)nameButtonClick
{
    self.group.isOpen = !self.group.isOpen;
    
    //判断有没有实现代理方法
//    if ([self.delegate respondsToSelector:@selector(headerViewIsOpen:)]) {
//        [self.delegate headerViewIsOpen:self];
//    }
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"friend" object:self userInfo:nil];
    
    //block3, 连接block
    if (self.block) {
        self.block(self);
    }
}

@end
