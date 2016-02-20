//
//  ViewController.m
//  多线程-单例模式-宏
//
//  Created by 倪凡乐 on 16/2/18.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLMusicTool.h"
#import "NFLSoundTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NFLMusicTool *tool = [[NFLMusicTool alloc] init];
    
#if __has_feature(objc_arc)
    // 编译器是ARC环境
#else
    // 编译器是MRC环境
    [tool release];
#endif

    
}


@end
