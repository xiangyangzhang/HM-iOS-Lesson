//
//  SWNavigationController.m
//  
//
//  Created by 倪凡乐 on 16/2/28.
//
//

#import "SWNavigationController.h"

@interface SWNavigationController ()

@end

@implementation SWNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
        
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

/**
 *  重写本方法，隐藏标签栏，能够阻拦所有 push 的控制器，记得 super 一下
 *
 *  @param viewController push 后的控制器
 *  @param animated       动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 若 push 后的控制器不是根控制器，隐藏标签栏
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];

}





@end
