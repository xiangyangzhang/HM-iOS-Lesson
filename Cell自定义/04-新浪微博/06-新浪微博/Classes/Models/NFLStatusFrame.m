//
//  NFLStatusFrame.m
//  
//
//  Created by 倪凡乐 on 15/12/28.
//
//

#import "NFLStatusFrame.h"
#import "NFLStatus.h"
#import "NSString+Tools.h"


/** 姓名字体 */
#define kNameFont   [UIFont systemFontOfSize:14]
/** 正文字体 */
#define kTextFont   [UIFont systemFontOfSize:16]

@implementation NFLStatusFrame
//@synthesize iconF = _iconF;

/**
 一旦重写了readonly属性的getter方法，_的成员变量就不存在了
 
 如果还需要使用_成员变量，则需要使用@synthesize生成对应的成员变量
 */
//- (CGRect)iconF
//{
//
//}

- (void)setStatus:(NFLStatus *)status
{
    _status = status;
    
    // 0. 定义间距
    CGFloat padding = 10;
    
    // 1. 头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2. 姓名大小由文字的长度来决定
    // boundingRectWithSize计算给定文本字符串所占的区域
    // 返回值是一个x,y = 0的CGRect,w,h是计算好的宽高
    //
    // 如果要计算多行的准确高度，需要传入NSStringDrawingUsesLineFragmentOrigin选项
    // dict用于指定字体的相关属性的字典，UIKit框架中的第一个头文件
    // context: nil
    NSDictionary *nameDict = @{NSFontAttributeName: kNameFont};
    //    CGRect nameFrame = [self.status.name boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nameDict context:nil];
    CGRect nameFrame = [self.status.name textRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) attributes:nameDict];
    
    nameFrame.origin.x = CGRectGetMaxX(self.iconF) + padding;
    nameFrame.origin.y = padding + (self.iconF.size.height - nameFrame.size.height) * 0.5;
    _nameF = nameFrame;
    
    // vip图标
    CGFloat vipX = CGRectGetMaxX(self.nameF) + padding;
    CGFloat vipY = self.nameF.origin.y;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 正文
    NSDictionary *textDict = @{NSFontAttributeName: kTextFont};
    //    CGRect textFrame = [self.status.text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    CGRect textFrame = [self.status.text textRectWithSize:CGSizeMake(355, MAXFLOAT) attributes:textDict];
    
    textFrame.origin.x = padding;
    textFrame.origin.y = CGRectGetMaxY(self.iconF) + padding;
    _textF = textFrame;
    
    if (self.status.picture.length > 0) {
        // 配图
        CGFloat pictureX = padding;
        CGFloat pictureY = CGRectGetMaxY(textFrame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        
        _cellHeight = CGRectGetMaxY(self.pictureF) + padding;
    } else {
        _cellHeight = CGRectGetMaxY(self.textF) + padding;
    }
}

+ (NSArray *)statusFrames
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        // 要添加statusFrame对象
        NFLStatusFrame *statusFrame = [[NFLStatusFrame alloc] init];
        
        // 实例化一个新的Status模型
        NFLStatus *status = [NFLStatus statusWithDict:dict];
        
        // 调用自己的setter方法，保存status数据模型，同时计算出所有控件的位置
        statusFrame.status = status;
        
        // 将statusFrame添加到数组
        [arrayM addObject:statusFrame];
    }
    
    return arrayM;
}


@end
