//
//  ITLTabBarViewController.m
//  
//
//  Created by 倪凡乐 on 16/1/22.
//
//

#import "ITLTabBarViewController.h"
#import "ITLTabBarView.h"
#import "ITLNavigationController.h"
#import "ITLHallNavigationController.h"


@interface ITLTabBarViewController ()<ITLTabBarViewDelegate>

@end

@implementation ITLTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    ITLTabBarView *tabBarView = [[ITLTabBarView alloc]init];//init方法会调用initWithFrame
    
    //3. 调用
    //tabBarView.block = ^(int selectedIndex){
    //    self.selectedIndex = selectedIndex;
    //};
    [self addViewController];
    
    tabBarView.frame = self.tabBar.bounds;
    
    tabBarView.delegate = self;
    
    // 因为系统自动隐藏的是系统自带的tabBar
    [self.tabBar addSubview:tabBarView];
    
    NSString *imageName = nil;
    NSString *imageSelName = nil;
    
    for (int i = 0 ; i< self.childViewControllers.count; i++){
        
        //格式化字符串
        imageName = [NSString stringWithFormat:@"TabBar%d",i+1];
        imageSelName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        
        [tabBarView addTabBarButtonWithName:imageName selName:imageSelName];
    }
    
    //直接写本代码不切换，需实现具体方法，通过模拟器调用方法切换
    //self.selectedIndex = 4;

}


//添加控制器
- (void)addViewController
{
    ITLHallNavigationController *hallVC = [[ITLHallNavigationController alloc]init];
    UINavigationController *buyVC = [[UINavigationController alloc]init];
    UINavigationController *awardVC = [[UINavigationController alloc]init];
    UINavigationController *randomVC = [[UINavigationController alloc]init];
    UINavigationController *infoVC = [[UINavigationController alloc]init];
    
    hallVC.view.backgroundColor = [UIColor greenColor];
    buyVC.view.backgroundColor = [UIColor blueColor];
    awardVC.view.backgroundColor = [UIColor redColor];
    randomVC.view.backgroundColor = [UIColor purpleColor];
    infoVC.view.backgroundColor = [UIColor grayColor];

    self.viewControllers = @[hallVC,buyVC,awardVC,randomVC,infoVC];

}

//切换控制器
- (void)tabBarView:(ITLTabBarView *)tabBarView didselectedIndex:(int)selectedIndex
{
    self.selectedIndex = selectedIndex;
}


@end
