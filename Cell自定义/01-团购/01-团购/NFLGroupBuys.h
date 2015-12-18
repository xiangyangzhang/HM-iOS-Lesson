//
//  NFLGroupBuys.h
//  
//
//  Created by 倪凡乐 on 15/12/17.
//
//

#import <Foundation/Foundation.h>

@interface NFLGroupBuys : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *buyCount;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)groupBuysWithDict:(NSDictionary *)dict;

+ (NSArray *)groupBuys;


@end
