//
//  SWSearchBar.m
//  frame 值需在初始化后设置，控件才能显示
//
//  Created by 倪凡乐 on 16/2/29.
//
//

#import "SWSearchBar.h"

@implementation SWSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入搜索条件";
        UIImage *searchBarImage = [UIImage imageNamed:@"searchbar_textfield_background"];
        self.background = [searchBarImage stretchableImageWithLeftCapWidth:searchBarImage.size.width *0.5 topCapHeight:searchBarImage.size.height * 0.5];
        
        // 通过init来创建初始化绝大部分控件，控件都是没有尺寸
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        // 设置图片居中填充
        searchIcon.contentMode = UIViewContentModeCenter;
        // 设置左侧缩进
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    
    }
    return self;
}



@end
