//
//  NFLAutoReply.h
//  
//
//  Created by 倪凡乐 on 16/1/3.
//
//

#import <Foundation/Foundation.h>

@interface NFLAutoReply : NSObject
@property (nonatomic, copy) NSString *send;
@property (nonatomic, copy) NSString *reply;


-(instancetype)initWithDict:(NSDictionary *)dict;
-(NSString *)description;
+(instancetype)autoReplyWithDict:(NSDictionary *)dict;

+ (NSArray *)autoReply;


@end
