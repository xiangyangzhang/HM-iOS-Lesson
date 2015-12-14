//
//  ViewController.m
//  04-汽车品牌
//
//  Created by 倪凡乐 on 15/12/14.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLCarGroup.h"

@interface ViewController ()
@property (nonatomic, strong)NSArray *carGroups;

@end

@implementation ViewController

- (NSArray *)carGroups
{
    if (_carGroups == nil) {
        _carGroups = [NFLCarGroup carGroup];
    }
    return _carGroups;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"%@",self.carGroups);

    
}



@end
