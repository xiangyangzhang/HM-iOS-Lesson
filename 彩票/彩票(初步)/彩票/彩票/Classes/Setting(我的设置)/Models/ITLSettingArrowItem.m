//
//  ITLSettingArrowItem.m
//  
//
//  Created by 倪凡乐 on 16/2/6.
//
//

#import "ITLSettingArrowItem.h"

@implementation ITLSettingArrowItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title devtVcClass:(Class)destVcClass
{
    ITLSettingArrowItem *item = [super itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    return item;
}

@end
