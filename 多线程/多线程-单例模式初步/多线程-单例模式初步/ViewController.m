//
//  ViewController.m
//  多线程-单例模式初步
//
//  Created by 倪凡乐 on 16/2/16.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLMusicTool.h"
#import "NFLSoundTool.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 static : 修饰变量
 1> 修饰全局变量
 * 全局变量的作用域仅限于当前文件内部
 
 2> 修饰局部变量 :
 * 局部变量的生命周期 跟 全局变量 类似
 *　但是不能改变作用域
 * 能保证局部变量永远只初始化1次，在程序运行过程中，永远只有1份内存
 */


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // extern 可全局搜索引用，除非全局变量被定义为 static
    // extern id _musicTool;
    // NSLog(@"%@",_musicTool);
    
    NFLMusicTool *tool1 = [NFLMusicTool shareMusicTool];
    NFLMusicTool *tool2 = [[NFLMusicTool alloc]init];
    NFLMusicTool *tool3 = [[NFLMusicTool alloc]init];
    NFLMusicTool *tool4 = [tool3 copy];
    NFLSoundTool *tool5 = [NFLSoundTool shareSoundTool];
    NFLSoundTool *tool6 = [[NFLSoundTool alloc]init];
    
    NSLog(@"%@  %@  %@  %@ %@ %@",tool1,tool2,tool3,tool4,tool5,tool6);
    
}


@end
