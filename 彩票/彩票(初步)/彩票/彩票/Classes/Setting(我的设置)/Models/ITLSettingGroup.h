//
//  ITLSettingGroup.h
//  
//
//  Created by 倪凡乐 on 16/2/6.
//
//

#import <Foundation/Foundation.h>

@interface ITLSettingGroup : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;
@property (nonatomic, strong)NSArray *items;

@end
