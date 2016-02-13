//
//  ViewController.m
//  多线程-同步异步并发
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
    
//    [self asyncGlobalQueue];
    [self asyncSerialQueue];

    
}

/**
 *  异步线程，并行队列
 */
- (void)asyncGlobalQueue
{
    //创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });

}
/**
 *  异步线程，串行队列
 */
- (void)asyncSerialQueue
{
    //创建队列
    dispatch_queue_t queue = dispatch_queue_create("www.uncoverman.com", NULL);
    
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    
    // 如非ARC，需要释放创建的队列
    // dispatch_release(queue);

}

/**
 *  获得主线程，用于线程间的数据传递
 */
- (void)asyncMainQueue
{
    //创建队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"线程%@",[NSThread currentThread]);
    });

}


@end
