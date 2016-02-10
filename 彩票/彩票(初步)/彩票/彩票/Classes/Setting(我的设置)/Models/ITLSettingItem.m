//
//  ITLSettingItem.m
//  
//
//  Created by 倪凡乐 on 16/2/5.
//
//

#import "ITLSettingItem.h"

@implementation ITLSettingItem


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    ITLSettingItem *item = [[self alloc]init];
    item.icon = icon;
    item.title = title;
    
    return item;
}

@end
