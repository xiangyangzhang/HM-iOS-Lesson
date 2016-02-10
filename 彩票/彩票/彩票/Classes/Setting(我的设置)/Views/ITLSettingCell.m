//
//  ITLSettingCell.m
//  
//
//  Created by 倪凡乐 on 16/2/6.
//
//

#import "ITLSettingCell.h"
#import "ITLSettingArrowItem.h"
#import "ITLSettingSwitchItem.h"

@interface ITLSettingCell()

@property (nonatomic, strong)UIImageView *imgView;
@property (nonatomic, strong)UISwitch *swithView;

@end

@implementation ITLSettingCell

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
        
    }
    return _imgView;
}

- (UISwitch *)swithView
{
    if (_swithView == nil) {
        _swithView = [[UISwitch alloc]init];
    }
    return _swithView;
}


- (void)setItem:(ITLSettingItem *)item
{
    _item = item;
    
    [self setData];
    [self setAccessoryView];
    
    
}

- (void)setData
{
    if (self.item.icon.length > 0) {
        
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
}

- (void)setAccessoryView
{
    if ([self.item isKindOfClass:[ITLSettingArrowItem class]]) {
        
        self.accessoryView = self.imgView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }else if([self.item isKindOfClass:[ITLSettingSwitchItem class]]){
        
        self.accessoryView = self.swithView;
        //选中无效
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else{

        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID =@"cell";
    ITLSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell ==  nil) {
        cell = [[ITLSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}




@end
