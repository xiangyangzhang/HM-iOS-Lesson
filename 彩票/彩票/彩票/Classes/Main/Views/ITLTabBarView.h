//
//  ITLTabBarView.h
//  
//
//  Created by 倪凡乐 on 16/1/22.
//
//

#import <UIKit/UIKit.h>

//block相当于函数，只是不编译的时候不执行，通常为没有返回值，为void，放置位置为方便取得变量的地方
//本例子中将block执行放于ITLTabBarController中
//1. 给block取别名
//typedef void(^ITLTabBarViewBlock)(int selectedIndex);
@class ITLTabBarView;

@protocol ITLTabBarViewDelegate <NSObject>

@optional
- (void)tabBarView:(ITLTabBarView *)tabBarView didselectedIndex:(int)selectedIndex;

@end

@interface ITLTabBarView : UIView

@property (nonatomic,weak)id <ITLTabBarViewDelegate>delegate;

//2. 声明，ARC中一般使用copy类型
//@property (nonatomic,copy)ITLTabBarViewBlock block;

@end
