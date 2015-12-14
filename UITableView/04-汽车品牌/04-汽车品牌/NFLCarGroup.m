//
//  NFLCarGroup.m
//  
//
//  Created by 倪凡乐 on 15/12/14.
//
//

#import "NFLCarGroup.h"
#import "NFLCar.h"

@implementation NFLCarGroup

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        [self setValue:dict[@"title"] forKey:@"title"];
        
        //dict[@"cars"]存放的是字典的数组
        //希望将字典的数组转换成NFLCar模型的数组
        
        self.cars = [NFLCar carsWithArray:dict[@"cars"]];
        
        
        //[self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

+ (instancetype)carGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSArray *)carGroup
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"cars_total.plist" ofType:nil]];
    
    NSMutableArray *arrayM =[NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self carGroupWithDict:dict]];
    }
    return arrayM;
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p>{title: %@, cars: %@}",self.class,self,self.title,self.cars];
}

@end
