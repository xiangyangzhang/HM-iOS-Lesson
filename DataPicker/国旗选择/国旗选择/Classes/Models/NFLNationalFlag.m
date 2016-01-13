//
//  NFLNationalFlag.m
//  
//
//  Created by 倪凡乐 on 16/1/12.
//
//

#import "NFLNationalFlag.h"

@implementation NFLNationalFlag

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)nationalFlagWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSArray *)nationalFlag
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"NationalFlag.plist" ofType:nil]];
    
    NSMutableArray *arrayM =[NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self nationalFlagWithDict:dict]];
    }
    return arrayM;
    
}

@end
