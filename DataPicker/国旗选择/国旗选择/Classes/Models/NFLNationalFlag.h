//
//  NFLNationalFlag.h
//  
//
//  Created by 倪凡乐 on 16/1/12.
//
//

#import <Foundation/Foundation.h>

@interface NFLNationalFlag : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)nationalFlagWithDict:(NSDictionary *)dict;

+ (NSArray *)nationalFlag;


@end
