//
//  NFLStatusCell.m
//  
//
//  Created by 倪凡乐 on 15/12/24.
//
//

#import "NFLStatusCell.h"
#import "NFLStatus.h"

/** 姓名字体 */
#define kNameFont [UIFont systemFontOfSize:14]

/** 正文字体 */
#define kTextFont [UIFont systemFontOfSize:16]


@interface NFLStatusCell()

@property (nonatomic, strong)UIImageView *iconView;
@property (nonatomic, strong)UILabel *nameView;
@property (nonatomic, strong)UIImageView *vipView;
@property (nonatomic, strong)UILabel *textView;
@property (nonatomic, strong)UIImageView *pictureView;

@end

@implementation NFLStatusCell

- (UIImageView *)iconView
{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconView];
    }
    return _iconView;
}


- (UILabel *)nameView
{
    if (_nameView == nil) {
        _nameView = [[UILabel alloc] init];
        //默认字体是17号
        _nameView.font = kNameFont;
        
        [self.contentView addSubview:_nameView];
    }
    return _nameView;
}

- (UIImageView *)vipView
{
    if (_vipView == nil) {
        _vipView = [[UIImageView alloc] init];
        _vipView.image = [UIImage imageNamed:@"vip"];
        _vipView.hidden = YES;

        [self.contentView addSubview:_vipView];
    }
    return _vipView;
}

- (UILabel *)textView
{
    if (_textView == nil) {
        _textView = [[UILabel alloc] init];
        _textView.font = kTextFont;
        //UILabel换行
        _textView.numberOfLines = 0;

        [self.contentView addSubview:_textView];
    }
    return _textView;
}

- (UIImageView *)pictureView
{
    if (_pictureView == nil) {
        _pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}

- (void)setStatus:(NFLStatus *)status
{
    _status = status;
    
    //1> 设置数据
    [self settingData];
    
    //2> 设置位置
    [self settingFrame];
    
}

/** 设置数据 */
- (void)settingData
{
    //头像
    self.iconView.image = [UIImage imageNamed:self.status.icon];
    
    //姓名
    self.nameView.text = self.status.name;
    
    //vip(可选)
    if (self.status.vip) {
        self.vipView.hidden = NO;
        self.nameView.textColor = [UIColor redColor];
    }else{
        self.vipView.hidden = NO;
        self.nameView.textColor = [UIColor redColor];
    }
    
    //正文
    self.textView.text = self.status.text;
    
    //配图（可选）

    if (self.pictureView > 0) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:self.status.picture];
    }else{
        self.pictureView.hidden = YES;
    }
}

/** 设置位置 */

- (void)settingFrame
{
    //0. 定义间距
    CGFloat padding = 10;
    
    //1. 头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //2. 姓名大小由文字长度决定
    //boundingRectWithSize计算给定文本字符串所占的区域
    //返回值是一个x,y = 0 的CGRect,w,是计算好的宽高
    //如果要计算多行的准确高度，需传入NSStringDrawingUsesLineFragmentOrigin选项
    //dict用于指定字体的相关属性字典，UIKit框架的第一个头文件
    
    NSDictionary *nameDict = @{NSFontAttributeName:kNameFont};
    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(MAXFLOAT,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    
    nameFrame.origin.x = CGRectGetMaxX(self.iconView.frame) +padding;
    nameFrame.origin.y = padding + (self.iconView.bounds.size.height - nameFrame.size.height) * 0.5;
    self.nameView.frame = nameFrame;
    
    //3. VIP图标
    CGFloat vipX = CGRectGetMaxX(nameFrame)+padding;
    CGFloat vipY = nameFrame.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    
    self.vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    
    //4. 正文
    NSDictionary *textDict = @{NSFontAttributeName:kTextFont};
    CGRect textFrame = [self.status.text boundingRectWithSize:CGSizeMake(355, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    textFrame.origin.x = padding;
    textFrame.origin.y = CGRectGetMaxY(self.iconView.frame)+padding;
    
    self.textView.frame = textFrame;
    
    CGFloat cellHeight;
    
    if (self.status.picture > 0) {
        //5. 图片
        CGFloat pictureX = padding;
        CGFloat pictureY = CGRectGetMaxY(self.textView.frame)+padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        
        self.pictureView.frame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        cellHeight = CGRectGetMaxY(self.pictureView.frame)+padding;
        
    }else{
        cellHeight = CGRectGetMaxY(self.textView.frame)+padding; 
    }
    
}



@end
