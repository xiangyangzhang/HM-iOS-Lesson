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
        
    }
    return self;
}

- (void)addTabBarButtonWithName:(NSString *)imageName selName:(NSString *)imageSelName
{
    //创建按钮，无高亮
    ITLTabBarButton *btn = [ITLTabBarButton buttonWithType:UIButtonTypeCustom];
    
    //设置按钮背景图片
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:imageSelName] forState:UIControlStateSelected];
    
    //监听点击按钮
    //不实现监听方法，无法实现选中
    //此处必须传参数，才能知道哪个按钮被选中
    //UIControlEventTouchDown，按下去马上反应
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];


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
        
        //绑定角标
        btn.tag = i;
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 默认第一个被选中
        if (i == 0) {
            [self btnClick:btn];
        }
    }
    
}


@end
