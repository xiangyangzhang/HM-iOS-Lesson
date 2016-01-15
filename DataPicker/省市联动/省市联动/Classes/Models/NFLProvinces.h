//
//  NFLProvinces.h
//  
//
//  Created by 倪凡乐 on 16/1/13.
//
//

#import <Foundation/Foundation.h>

@interface NFLProvinces : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, strong)NSArray *cities;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)provinceWithDict:(NSDictionary *)dict;

+ (NSArray *)province;


@end
