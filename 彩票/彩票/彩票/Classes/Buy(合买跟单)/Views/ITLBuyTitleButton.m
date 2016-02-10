//
//  ITLBuyTitleButton.m
//  
//
//  Created by 倪凡乐 on 16/2/1.
//
//

#import "ITLBuyTitleButton.h"

@implementation ITLBuyTitleButton

//xib、storyboard创建界面后初始化
//- (void)awakeFromNib
//{
//    self.imageView.contentMode = UIViewContentModeCenter;
//}

//代码创建时界面初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //不填充放大
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = 0;
    
    NSDictionary *dict = @{
                           NSFontAttributeName : [UIFont systemFontOfSize:18]
                           };
    //根据文字多少计算宽度
    titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil].size.width;

    CGFloat titleH = contentRect.size.height;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 15;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0 ;
    
    return CGRectMake(imageX, imageY, imageW, imageH);


}

@end
