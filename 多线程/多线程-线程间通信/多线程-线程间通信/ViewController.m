//
//  ViewController.m
//  多线程-线程间通信
//
//  Created by 倪凡乐 on 16/2/14.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.button addTarget:self action:@selector(downloadPhoto) forControlEvents:UIControlEventTouchUpInside];
}

- (void)downloadPhoto{

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        
        NSString *urlString = @"https://www.baidu.com/img/270_7573fb368053e6805e63b56352ce7287.gif";
        
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        NSLog(@"%@",[NSThread currentThread]);
        
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_async(mainQueue, ^{
            [self.button setImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
            NSLog(@"%@",[NSThread currentThread]);

        });
        
    });
    
}


@end
