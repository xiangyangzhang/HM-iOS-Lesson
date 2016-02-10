//
//  ITLSettingItem.h
//  
//
//  Created by 倪凡乐 on 16/2/5.
//
//

#import <Foundation/Foundation.h>

//1. 命名代码块
typedef void(^ITLSettingItemOption)();

@interface ITLSettingItem : NSObject

@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *title;
//2. 声明代码块
@property (nonatomic, copy)ITLSettingItemOption option;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

@end
