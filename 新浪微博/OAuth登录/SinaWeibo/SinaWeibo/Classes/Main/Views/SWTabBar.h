//
//  SWTabBar.h
//  
//
//  Created by 倪凡乐 on 16/2/29.
//
//

#import <UIKit/UIKit.h>

@class SWTabBar;

@protocol SWTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(SWTabBar *)tabBar;

@end

@interface SWTabBar : UITabBar

@property (nonatomic, weak) id<SWTabBarDelegate> delegate;

@end
