//
//  NFLAutoReply.m
//  
//
//  Created by 倪凡乐 on 16/1/3.
//
//

#import "NFLAutoReply.h"

@implementation NFLAutoReply

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)autoReplyWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSArray *)autoReply
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"autoReply.plist" ofType:nil]];
    
    NSMutableArray *arrayM =[NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self autoReplyWithDict:dict]];
    }
    return arrayM;
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"send:%@,reply:%@",self.send,self.reply];
}

@end
