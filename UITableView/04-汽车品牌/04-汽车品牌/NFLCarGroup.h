//
//  NFLCarGroup.h
//  
//
//  Created by 倪凡乐 on 15/12/14.
//
//

#import <Foundation/Foundation.h>

@interface NFLCarGroup : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *cars;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carGroupWithDict:(NSDictionary *)dict;

+ (NSArray *)carGroup;


@end
