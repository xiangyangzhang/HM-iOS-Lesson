//
//  NFLStatus.h
//  
//
//  Created by 倪凡乐 on 15/12/21.
//
//

#import <Foundation/Foundation.h>

@interface NFLStatus : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL vip;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)statusWithDict:(NSDictionary *)dict;

+ (NSArray *)statuses;

@end
