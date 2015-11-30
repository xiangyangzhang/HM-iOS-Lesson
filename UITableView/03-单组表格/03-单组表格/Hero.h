//
//  Hero.h
//  
//
//  Created by 倪凡乐 on 15/11/30.
//
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *intro;
@property (nonatomic,strong)NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)heroWithDict:(NSDictionary *)dict;

+ (NSArray *)heroes;


@end
