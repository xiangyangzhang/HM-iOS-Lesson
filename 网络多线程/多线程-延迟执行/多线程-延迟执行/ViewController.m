//
//  ViewController.m
//  多线程-延迟执行
//
//  Created by 倪凡乐 on 16/2/14.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"Touch begins");
    
    [self delay1];
    [self delay2];
    [self delay3];
        
    NSLog(@"Touch ends");
    
}

- (void)download
{
    NSLog(@"%@ download",[NSThread currentThread]);
}

- (void)delay1
{
    [self performSelector:@selector(download) withObject:nil afterDelay:3];
    
}

- (void)delay2
{
    //延迟执行
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), queue, ^{
        [self download];
    });
}

//主线程睡眠，会卡住，不适用
- (void)delay3
{
    [NSThread sleepForTimeInterval:3];
    [self download];
}

@end
