//
//  ViewController.m
//  03-排序及乱序
//
//  Created by 倪凡乐 on 15/10/13.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array =@[@(1),@(4),@(3),@(5)];
    
    //乱序
    array = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *num1, NSNumber *num2) {
        
        int seed = arc4random_uniform(2);//生成小于2的整数
        if (seed) {
            return [num1 compare:num2];//升序
        }else{
            return [num2 compare:num1];//降序
        }
    }];
    
    
    //循环块代码，含对象、索引和停止指令
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@",obj);
        
        if (idx == 3) {
            *stop = YES;
        }
    }];
    
    
}


@end
