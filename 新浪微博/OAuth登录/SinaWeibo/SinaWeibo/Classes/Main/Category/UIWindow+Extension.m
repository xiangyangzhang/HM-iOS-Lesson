//
//  UIWindow+Extension.m
//  
//
//  Created by 倪凡乐 on 16/3/8.
//
//

#import "UIWindow+Extension.h"
#import "SWTabBarViewController.h"
#import "SWNewFeatureController.h"

@implementation UIWindow (Extension)

- (void)switchRootViewController
{
    
    NSString *key = @"CFBundleVersion";
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults]objectForKey:key];
    
    // 当前软件版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
    
        SWTabBarViewController *tabBarController = [[SWTabBarViewController alloc]init];
        tabBarController.view.backgroundColor = MRandomColor;
        self.window.rootViewController = tabBarController;
    
    }else{
        // 将当前版本号存进沙盒
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
            
        self.window.rootViewController = [[SWNewFeatureController alloc]init];
    
    }
    
}

@end
