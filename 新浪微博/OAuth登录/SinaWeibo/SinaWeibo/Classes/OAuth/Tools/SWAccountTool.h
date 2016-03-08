//
//  SWAccountTool.h
//  
//
//  Created by 倪凡乐 on 16/3/8.
//
//

#import <Foundation/Foundation.h>
#import "SWAccount.h"

@interface SWAccountTool : NSObject

/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(SWAccount *)account;

/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (SWAccount *)account;


@end
