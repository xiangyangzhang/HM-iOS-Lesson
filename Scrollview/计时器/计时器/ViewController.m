//
//  ViewController.m
//  计时器
//
//  Created by 倪凡乐 on 15/11/3.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (strong, nonatomic)NSTimer *timer;
@end

@implementation ViewController

/** 开始 */
- (IBAction)start
{
    //倒计时10秒，每秒更新一些Label的显示
    /** 参数说明
     1、时间间隔，double
     2、监听时钟触发的对象
     3、调用方法
     4、userInfo，可以是任意对象，通常传nil，若一个程度多个timer，可用
     5、repeats：是否重复
     */
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:@"hello timer" repeats:YES];
}

/** 时钟更新方法 */
- (void)updateTimer:(NSTimer *)timer
{
    NSLog(@"%s",__func__);
    NSLog(@"%@",timer.userInfo);
    
    //1、取出标签数字
    int counter = self.countLabel.text.intValue;
    
    //2、判断是否为零，如果为0，停止时钟
    if (--counter < 0){
        //停止时钟
        [self pause];
        
        //提示用户
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"开始" message:@"开始啦" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alert show];
        
    }else{
        //Ctrl + I
        //3、修改数字并更新UI
        self.countLabel.text = [NSString stringWithFormat:@"%d",counter];

    }
}

- (IBAction)pause
{
    //停止时钟，invalidate是唯一停止时钟的方法
    //一旦调用了invalidate，timer就无效了，再次用需要再次实例化
    [self.timer invalidate];
}

@end
