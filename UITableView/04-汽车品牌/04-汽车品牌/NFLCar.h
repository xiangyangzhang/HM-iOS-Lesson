//
//  NFLCar.h
//  
//
//  Created by 倪凡乐 on 15/12/14.
//
//

#import <Foundation/Foundation.h>

@interface NFLCar : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *icon;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)carWithDictionary:(NSDictionary *)dict;

+ (NSArray *)carsWithArray:(NSArray *)array;


@end
