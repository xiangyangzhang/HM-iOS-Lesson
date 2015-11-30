//
//  Hero.m
//  
//
//  Created by 倪凡乐 on 15/11/30.
//
//

#import "Hero.h"

@implementation Hero

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSArray *)heroes
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"heros.plist" ofType:nil]];
            
    NSMutableArray *arrayM =[NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self heroWithDict:dict]];
    }
    return arrayM;

}


@end
