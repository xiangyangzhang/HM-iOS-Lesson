//
//  ViewController.m
//  超级猜图
//
//  Created by 倪凡乐 on 15/10/5.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@end

@implementation ViewController

//状态栏显示形式
//UIStatusBarStyleDefault：dark
//UIStatusBarStyleLightContent:light
//- (UIStatusBarStyle)perferredStatusBarStyle

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (IBAction)bigImage
{
    //1、遮罩
    UIButton *cover = [[UIButton alloc]initWithFrame:self.view.bounds];//布满窗口
    cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    [self.view addSubview:cover];
    
    //Target-action模式，调用smallImage方法，冒号表示方法含参数
    [cover addTarget:self action:@selector(smallImage:) forControlEvents:UIControlEventTouchUpInside];
    
    //2、把图片移到最前面
    [self.view bringSubviewToFront:self.iconButton];
    
    //3、动画
    CGFloat w = self.view.bounds.size.width;
    CGFloat h = w;
    CGFloat y = (self.view.bounds.size.height - h)*0.5;
    
    //控制动画时间
    [UIView animateWithDuration:1.0f animations:^{
        self.iconButton.frame = CGRectMake(0, y, w, h);
        cover.alpha = 1.0;
    }];
    
}

- (void)smallImage:(UIButton *)cover
{
    [UIView animateWithDuration:1.0f animations:^{
        self.iconButton.frame = CGRectMake(80, 90, 165, 165);
        cover.alpha = 0.0;
    }completion:^(BOOL finished) {
        //动画完成之后删除cover
        [cover removeFromSuperview];
    }
     ];
    
    
}



@end
