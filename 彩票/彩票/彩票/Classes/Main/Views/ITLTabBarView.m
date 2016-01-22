//
//  ITLTabBarView.m
//  
//
//  Created by 倪凡乐 on 16/1/22.
//
//

#import "ITLTabBarView.h"
#import "ITLTabBarButton.h"

@interface ITLTabBarView()

@property (nonatomic, weak)UIButton *selectedButton;

@end

@implementation ITLTabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addBtns];
    }
    return self;
}


- (void)addBtns
{
    NSString *imageName = nil;
    NSString *imageSelName = nil;
    
    for (int i = 0; i<5; i++) {
        
        ITLTabBarButton *btn = [ITLTabBarButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = i;
        
        //格式化字符串
        imageName = [NSString stringWithFormat:@"TabBar%d",i+1];
        imageSelName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:imageSelName] forState:UIControlStateSelected];
        
        //不实现监听方法，无法实现选中
        //此处必须传参数，才能知道哪个按钮被选中
        //UIControlEventTouchDown，按下去马上反应
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
        //默认第一个被选中
        if (i == 0) {
            [self btnClick:btn];
        }
        
    }
}

//点击时调用
- (void)btnClick:(UIButton *)btn
{
    _selectedButton.selected = NO;
    btn.selected = YES;
    _selectedButton = btn;
    
    
    //切换控制器
    if ([_delegate respondsToSelector:@selector(tabBarView:didselectedIndex:)]) {
        [_delegate tabBarView:self didselectedIndex:btn.tag];
    }
    
    //4. 传值
    //切换控制器
    //判断是否存在block，如果不判断，会报错
    //if (_block) {
    //    _block(btn.tag);
    //}
}


- (void)layoutSubviews//如果initWithFrame中frame为空，调用此方法
{
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    for (int i = 0; i<self.subviews.count; i++) {
        
        UIButton *btn =self.subviews[i];
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
    
}


@end
