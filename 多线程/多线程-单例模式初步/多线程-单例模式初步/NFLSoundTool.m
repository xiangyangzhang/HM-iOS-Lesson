//
//  NFLSoundTool.m
//  
//
//  Created by 倪凡乐 on 16/2/16.
//
//  饿汉式

#import "NFLSoundTool.h"

@implementation NFLSoundTool

static id _instance;

/**
 *  当类一加载 OC 环境中就调用，只调用一次
 */
+ (void)load
{
    NSLog(@"load");
    _instance = [[self alloc] init];
    NSLog(@"load %@",_instance);
}

/**
 *  一使用类就调用，只调用一次, 执行在 alloc 方法之前
 */
//+ (void)initialize
//{
//    NSLog(@"initialize %@",_instance);
//}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    if (_instance == nil) {
        _instance = [super allocWithZone:zone];
        NSLog(@"after initialize");
    }
    return _instance;
}

+ (instancetype)shareSoundTool
{
    return _instance;
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

@end
