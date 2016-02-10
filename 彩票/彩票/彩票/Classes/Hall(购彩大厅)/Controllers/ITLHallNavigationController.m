//
//  ITLHallNavigationController.m
//  
//
//  Created by 倪凡乐 on 16/1/28.
//
//

#import "ITLHallNavigationController.h"
#import "ITLHallViewController.h"
#import "ITLHallInfoViewController.h"

@interface ITLHallNavigationController ()

@end

@implementation ITLHallNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    ITLHallViewController *hallViewController = [[ITLHallViewController alloc]init];
    ITLHallInfoViewController *hallInfoViewController = [[ITLHallInfoViewController alloc]init];

    self.viewControllers = @[hallViewController,hallInfoViewController];
    
    //默认打开根控制器
    [self popToRootViewControllerAnimated:YES];
    
    hallViewController.navigationItem.title = @"购彩大厅";
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    //自定义按钮，添加到UIBarButtonItem
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:[self addButton]];

    //把右边按钮添加到导航栏集合中去
    hallViewController.navigationItem.rightBarButtonItem = rightButton;
    
}

- (void)clickRightBtn
{
    ITLHallInfoViewController *hallInfoViewController = [[ITLHallInfoViewController alloc]init];
    
    [self pushViewController:hallInfoViewController animated:NO];
    
}

- (UIButton *)addButton
{
    //创建一个按钮
    UIButton *Btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [Btn setImage:[UIImage imageNamed:@"zixunBarFlat"] forState:UIControlStateNormal];
    [Btn setTitle:@"咨询" forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //设置按钮字体
    Btn.titleLabel.font =[UIFont systemFontOfSize:18.0];
    
    [Btn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
    
    return Btn;

}


@end
