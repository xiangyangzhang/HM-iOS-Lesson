//
//  NFLProvinces.m
//  
//
//  Created by 倪凡乐 on 16/1/13.
//
//

#import "NFLProvinces.h"

@implementation NFLProvinces

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)provinceWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSArray *)province
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"provinces.plist" ofType:nil]];
    
    NSMutableArray *arrayM =[NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self provinceWithDict:dict]];
    }
    return arrayM;
    
}

@end
