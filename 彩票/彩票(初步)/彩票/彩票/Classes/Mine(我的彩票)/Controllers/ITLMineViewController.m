//
//  ITLMineViewController.m
//  
//
//  Created by 倪凡乐 on 16/2/5.
//
//

#import "ITLMineViewController.h"
#import "ITLSettingController.h"

@interface ITLMineViewController ()

@end

@implementation ITLMineViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIViewController *mineController = [[UIViewController alloc]init];
    ITLSettingController *settingController = [[ITLSettingController alloc]init];
    
    mineController.navigationItem.title = @"我的彩票";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:nil action:@selector(click)];
    
    mineController.navigationItem.rightBarButtonItem = rightItem;
    
    self.viewControllers = @[mineController,settingController];
    
    //默认打开根控制器
    [self popToRootViewControllerAnimated:YES];

    
    //加图片
    CGFloat imageW = 300;
    CGFloat imageH = 140;
    CGFloat imageX = ([UIScreen mainScreen].bounds.size.width -imageW) *0.5;
    CGFloat imageY = 0;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
    
    imageView.image = [UIImage imageNamed:@"LoginScreen"];
    
    [mineController.view addSubview:imageView];
    
    //加按钮
    CGFloat logginBtnW = imageW;
    CGFloat logginBtnH = 30;
    CGFloat logginBtnX = imageX;
    CGFloat logginBtnY = CGRectGetMaxY(imageView.frame)+20;
    
    UIButton *logginBtn = [[UIButton alloc]initWithFrame:CGRectMake(logginBtnX, logginBtnY, logginBtnW, logginBtnH)];
    
    [logginBtn setTitle:@"登录" forState:UIControlStateNormal];
    UIImage *image =[UIImage imageNamed:@"RedButton"];
    //拉伸处理
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [logginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    [mineController.view addSubview:logginBtn];
    
}

- (void)click
{
    ITLSettingController *settingController = [[ITLSettingController alloc]init];
    [self pushViewController:settingController animated:NO];
}


@end
