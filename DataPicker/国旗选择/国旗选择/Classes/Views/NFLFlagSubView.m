//
//  NFLFlagView.m
//  
//
//  Created by 倪凡乐 on 16/1/12.
//
//

#import "NFLFlagSubView.h"
#import "NFLNationalFlag.h"

@interface NFLFlagSubView()

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UIImageView *iconView;

@end

@implementation NFLFlagSubView

+ (instancetype)flagSubView
{
    CGFloat mainScreenWidth = [UIScreen mainScreen].bounds.size.width;
    
    NFLFlagSubView *flagSubView = [[NFLFlagSubView alloc]initWithFrame:CGRectMake(0, 0, mainScreenWidth, 60)];

    return flagSubView;
}


//当flagSubView上子控件只需做一次操作或者要显示出来，写在此方法中

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label =[[UILabel alloc]init];
        label.frame = CGRectMake(frame.size.width * 0.25, 0, 50, 50);
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
        
        self.nameLabel = label;
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(frame.size.width * 0.5, 0, 80, 50);
        [self addSubview:imageView];
        
        self.iconView =imageView;

    }
    return self;
}

- (void)setFlag:(NFLNationalFlag *)flag
{
    _flag = flag;
    self.nameLabel.text = flag.name;
    self.iconView.image = [UIImage imageNamed:flag.icon];

}
@end
