//
//  NFLStatusCell.m
//  
//
//  Created by 倪凡乐 on 15/12/24.
//
//

#import "NFLStatusCell.h"
#import "NFLStatus.h"
#import "NFLStatusFrame.h"


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

- (void)setStatusFrame:(NFLStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    //1> 设置数据
    [self settingData];
    
    //2> 设置位置
    [self settingFrame];
    
}

/** 设置数据 */
- (void)settingData
{
    NFLStatus *status = self.statusFrame.status;
    
    //头像
    self.iconView.image = [UIImage imageNamed:status.icon];
    
    //姓名
    self.nameView.text = status.name;
    
    //vip(可选)
    if (status.vip) {
        self.vipView.hidden = NO;
        self.nameView.textColor = [UIColor redColor];
    }else{
        self.vipView.hidden = NO;
        self.nameView.textColor = [UIColor redColor];
    }
    
    //正文
    self.textView.text = status.text;
    
    //配图（可选）

    if (self.pictureView > 0) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:status.picture];
    }else{
        self.pictureView.hidden = YES;
    }
}

/** 设置位置 */

- (void)settingFrame
{
    // 1. 头像
    self.iconView.frame = self.statusFrame.iconF;
    
    // 2. 姓名大小由文字的长度来决定
    self.nameView.frame = self.statusFrame.nameF;
    
    // vip图标
    self.vipView.frame = self.statusFrame.vipF;
    
    // 正文
    self.textView.frame = self.statusFrame.textF;
    
    // 配图
    if (self.statusFrame.status.picture.length > 0) {
        self.pictureView.frame = self.statusFrame.pictureF;
    }
}



@end
