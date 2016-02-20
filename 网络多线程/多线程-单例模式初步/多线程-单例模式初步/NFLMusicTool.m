//
//  NFLMusicTool.m
//  
//
//  Created by 倪凡乐 on 16/2/16.
//
//  懒汉式

#import "NFLMusicTool.h"

@implementation NFLMusicTool

static id _instance;

// + (id)allocWithZone:(struct _NSZone *)zone 是 alloc 的底层方法
+ (id)allocWithZone:(struct _NSZone *)zone
{
    // 防止加锁多次
    if (_instance == nil) {
        // 加安全锁，保证多线程不会重复创建
        @synchronized(self){
            // 防止创建多次
            if (_instance == nil) {
                _instance = [super allocWithZone:zone];
            }
        }
    }
    return _instance;
    
}

// 额外写一个类方法，方便理解及调用
+ (instancetype)shareMusicTool
{
    //防止加锁多次
    if (_instance == nil) {
        
        @synchronized(self){
            //防止创建多次
            if (_instance == nil) {
                _instance = [[self alloc]init];
            }
        }
    }
    return _instance;
}

// 额外重写 copy 方法，保证单例
- (id)copyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

@end
