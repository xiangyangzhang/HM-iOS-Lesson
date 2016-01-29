//
//  ITLNavigationController.m
//  
//
//  Created by 倪凡乐 on 16/1/27.
//
//

#import "ITLNavigationController.h"

@interface ITLNavigationController ()

@end

@implementation ITLNavigationController

// 第一次使用这个类或者这个类的子类的时候
+ (void)initialize
{
    if (self == [ITLNavigationController class]) { // 肯定能保证只调用一次
        // 获取应用程序中所有的导航条
        // 获取所有导航条外观
        // appearance为协议方法
        UINavigationBar *bar = [UINavigationBar appearance];
        
        UIImage *navImage = nil;
        
        //判断系统是否为iOS7以上
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
            navImage = [UIImage imageNamed:@"NavBar64"];
        }else{
            navImage = [UIImage imageNamed:@"NavBar"];
        }
    
        [bar setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
        
        NSDictionary *dict = @{
                               NSForegroundColorAttributeName : [UIColor whiteColor],
                               NSFontAttributeName : [UIFont systemFontOfSize:18]
                               };
        [bar setTitleTextAttributes:dict];
        
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

}

//隐藏tabBar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;

    return [super pushViewController:viewController animated:animated];
}



@end
