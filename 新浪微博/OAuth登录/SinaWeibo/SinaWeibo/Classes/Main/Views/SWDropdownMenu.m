//
//  SWDropdownMenu.m
//  self 这个 view 大小为屏幕大小，containerView 才是下拉菜单大小
//
//  Created by 倪凡乐 on 16/2/29.
//
//

#import "SWDropdownMenu.h"

@interface SWDropdownMenu()

/**
 *  将来用来显示具体内容的容器
 */
@property (nonatomic, strong) UIImageView *containerView;


@end

@implementation SWDropdownMenu

- (UIImageView *)containerView
{
    if (!_containerView) {
        // 添加一个灰色图片控件,即下拉背景图
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.frame = CGRectMake(0, 0, 200, 200);
        containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.userInteractionEnabled = YES; // 开启交互
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 清除颜色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (instancetype)menu
{
    return [[self alloc]init];
}

- (void)setContent:(UIView *)content
{
    _content = content;
    
    // 调整内容的位置
    content.x = 10;
    content.y = 15;
    
    // 设置灰色的高度
    self.containerView.height = CGRectGetMaxY(content.frame) + 11;
    // 设置灰色的宽度
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    // 添加内容到灰色图片中
    [self.containerView addSubview:content];
    
}

- (void)setViewController:(UIViewController *)viewController
{
    _viewController = viewController;
    self.content = viewController.view;
}

- (void)showForm:(UIView *)form
{
    // 1.获得最上面的视图
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    // 2.把自己添加到窗口上
    [window addSubview:self];
    
    // 3.设置尺寸
    self.frame = window.bounds;
    
    // 4.调整灰色图片的位置
    // 默认情况下，frame 是以父控件左上角为坐标原点
    // 转换坐标系，相对于主窗口的位置 titleButton 的位置
    CGRect newFrame = [form convertRect:form.bounds toView:window];
    // 等价于：CGRect newFrame = [from.superview convertRect:from.frame toView:window];
    CGPoint center = CGPointMake(CGRectGetMidX(newFrame), 0);
    self.containerView.center = center;
    self.containerView.y = CGRectGetMaxY(newFrame);
    
}

// 消失
- (void)dismiss
{
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}



@end
