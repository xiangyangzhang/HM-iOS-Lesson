//
//  ViewController.m
//  多线程-线程同步
//
//  Created by 倪凡乐 on 16/2/13.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;
@property (nonatomic, strong) NSThread *thread3;

@property (nonatomic, assign) int leftTicketCount;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _leftTicketCount = 50;
    
    self.thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(ticketSale) object:nil];
    self.thread1.name = @"1号窗口";
    self.thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(ticketSale) object:nil];
    self.thread2.name = @"2号窗口";
    self.thread3 = [[NSThread alloc]initWithTarget:self selector:@selector(ticketSale) object:nil];
    self.thread3.name = @"3号窗口";

    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.thread1 start];
    [self.thread2 start];
    [self.thread3 start];
    
}

- (void)ticketSale
{
    while (1) {
        @synchronized(self){
        
            if (_leftTicketCount > 0) {
                
                [NSThread sleepForTimeInterval:0.05];
                
                _leftTicketCount -= 1;
                NSLog(@"%@卖了一张票, 剩余%d张票", [NSThread currentThread].name, _leftTicketCount);
            }else{
                return;
            }
        }
        
    }
}

@end
