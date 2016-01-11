//
//  NFLFriendsModel.m
//  
//
//  Created by 倪凡乐 on 16/1/6.
//
//

#import "NFLFriendsModel.h"

@implementation NFLFriendsModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)friendsWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSArray *)friendsWithArray:(NSArray *)array
{
    
    NSMutableArray *arrayM =[NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self friendsWithDict:dict]];
    }
    return arrayM;
    
}

@end
