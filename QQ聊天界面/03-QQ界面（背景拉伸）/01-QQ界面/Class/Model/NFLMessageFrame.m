//
//  NFLMessageFrame.m
//  
//
//  Created by 倪凡乐 on 16/1/2.
//
//

#import "NFLMessageFrame.h"
#import "NFLMessage.h"
#import "Constant.h"

@implementation NFLMessageFrame


- (void)setMessage:(NFLMessage *)message
{
    _message = message;
    
    //时间
    if (message.hideTime == 0) {
        
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = kScreenWidth;
        CGFloat timeH = kNormalHeight;
        
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    
    //头像
    CGFloat iconX;
    CGFloat iconY = CGRectGetMaxY(_timeF);
    CGFloat iconW = kIconWidth;
    CGFloat iconH = kIconHeight;
    
    
    if (message.type == NFLMessagTypeGatsby) {
        //自己发
        iconX = kScreenWidth-kPadding-kIconWidth;
    }else{
        //别人发
        iconX = kPadding;
    }
    
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);

    //正文
    CGFloat textX;
    CGFloat textY = iconY + kPadding;
    
    CGSize textMaxSize = CGSizeMake(kTextMaxWidth, MAXFLOAT);//确定正文最大宽度和高度
    CGSize textRealSize = [message.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kButtonFont} context:nil].size;
    //增大正文按钮
    CGSize btnSize = CGSizeMake(textRealSize.width+40, textRealSize.height+40);
    
    if (message.type == NFLMessagTypeGatsby) {
        //自己发
        textX = kScreenWidth - btnSize.width - iconW - kPadding;
        
    }else{
        //别人发
        textX = iconW + kPadding;
    }
    
    _textViewF = (CGRect){{textX,textY},btnSize};

    //行高
    CGFloat iconMaxY = CGRectGetMaxY(_iconF);
    CGFloat textMaxY = CGRectGetMaxY(_textViewF);
    
    _cellH = MAX(iconMaxY,textMaxY);
    
    NSLog(@"%f",_cellH);

    
    
}

@end
