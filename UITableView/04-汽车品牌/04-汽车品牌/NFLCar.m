//
//  NFLCar.m
//  
//
//  Created by 倪凡乐 on 15/12/14.
//
//

#import "NFLCar.h"

@implementation NFLCar


- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
    
}

+ (instancetype)carWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}

+ (NSArray *)carsWithArray:(NSArray *)array
{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self carWithDictionary:dict]];
    }
    
    return arrayM;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p>{name: %@, icon: %@}",self.class,self,self.name,self.icon];
}

@end
