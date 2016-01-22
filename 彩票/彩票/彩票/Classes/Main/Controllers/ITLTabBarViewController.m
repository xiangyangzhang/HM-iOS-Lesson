//
//  ITLTabBarViewController.m
//  
//
//  Created by 倪凡乐 on 16/1/22.
//
//

#import "ITLTabBarViewController.h"

#import "ITLTabBarView.h"

@interface ITLTabBarViewController ()<ITLTabBarViewDelegate>

@end

@implementation ITLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //移除原来的tabBar
    [self.tabBar removeFromSuperview];
    
    ITLTabBarView *tabBarView = [[ITLTabBarView alloc]init];//init方法会调用initWithFrame
    
    //3. 调用
    //tabBarView.block = ^(int selectedIndex){
    //    self.selectedIndex = selectedIndex;
    //};
    
    tabBarView.frame = self.tabBar.frame;
    
    tabBarView.delegate = self;
    
    [self.view addSubview:tabBarView];
    
    
    //直接写本代码不切换，需实现具体方法，通过模拟器调用方法切换
    //self.selectedIndex = 4;
    
    NSLog(@"%s",__func__);
    

}

- (void)tabBarView:(ITLTabBarView *)tabBarView didselectedIndex:(int)selectedIndex
{
    self.selectedIndex = selectedIndex;
}

@end
