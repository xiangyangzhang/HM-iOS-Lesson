//
//  NFLGroupBuysCellTableViewCell.m
//  
//
//  Created by 倪凡乐 on 15/12/18.
//
//

#import "NFLGroupBuysCellTableViewCell.h"
#import "NFLGroupBuys.h"


@interface NFLGroupBuysCellTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end

@implementation NFLGroupBuysCellTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Cell";
    
    //自定义cell类型
    NFLGroupBuysCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        
        NSLog(@"加载XIB");
        //从XIB加载自定义视图
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NFLGroupBuysCell" owner:nil options:nil]lastObject];
        
        //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;

}


- (void)setGroupBuys:(NFLGroupBuys *)groupBuys
{
    //setter方法第一句要复制，非常重要！！
    _groupBuys = groupBuys;
    self.titleLabel.text = groupBuys.title;
    self.iconView.image = [UIImage imageNamed:groupBuys.icon];
    self.priceLabel.text =  [NSString stringWithFormat:@"￥%@",groupBuys.price];
    self.buyCountLabel.text =[NSString stringWithFormat:@"已有%@人购买",groupBuys.buyCount];

}

/** 从XIB/Storyboard被加载后,此方法被调用 */
- (void)awakeFromNib {
    // Initialization code
    NSLog(@"%s",__func__);
}


/** 
 Cell 被选中或者取消选中都会被调用
 */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

//    if(selected){
//        
//    }else{
//        
//    }
}

@end
