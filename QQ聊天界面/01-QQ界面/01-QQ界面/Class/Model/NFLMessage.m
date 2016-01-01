//
//  NFLMessage.m
//  
//
//  Created by 倪凡乐 on 16/1/1.
//
//

#import "NFLMessage.h"

@implementation NFLMessage

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)messageWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSMutableArray *)message
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self messageWithDict:dict]];
    }
    
    return arrayM;
    
}

@end
