//
//  ITLSettingArrowItem.h
//  
//
//  Created by 倪凡乐 on 16/2/6.
//
//

#import "ITLSettingItem.h"

@interface ITLSettingArrowItem : ITLSettingItem

//调用的控制器的类名
@property (nonatomic, assign)Class destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title devtVcClass:(Class)destVcClass;

@end
