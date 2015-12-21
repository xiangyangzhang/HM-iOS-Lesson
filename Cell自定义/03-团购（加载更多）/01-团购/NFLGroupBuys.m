//
//  NFLGroupBuys.m
//  
//
//  Created by 倪凡乐 on 15/12/17.
//
//

#import "NFLGroupBuys.h"

@implementation NFLGroupBuys

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)groupBuysWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSMutableArray *)groupBuys
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil]];
    
    NSMutableArray *arrayM =[NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self groupBuysWithDict:dict]];
    }
    return arrayM;
    
}

@end
