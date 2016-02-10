//
//  ITLBuyNavigationController.m
//  
//
//  Created by 倪凡乐 on 16/2/1.
//
//

#import "ITLBuyNavigationController.h"
#import "ITLBuyTitleButton.h"

@implementation ITLBuyNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController *buyViewController = [[UIViewController alloc]init];
    
    self.viewControllers = @[buyViewController];
        
    buyViewController.navigationItem.titleView = [self addButton];
    
}

- (UIButton *)addButton
{
    //创建一个按钮
    ITLBuyTitleButton *Btn = [[ITLBuyTitleButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [Btn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [Btn setTitle:@"全部彩种" forState:UIControlStateNormal];
    [Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //设置按钮字体
    Btn.titleLabel.font =[UIFont systemFontOfSize:18.0];
    
    return Btn;
    
}


@end
