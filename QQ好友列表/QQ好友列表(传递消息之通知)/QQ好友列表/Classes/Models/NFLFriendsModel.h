//
//  NFLFriendsModel.h
//  
//
//  Created by 倪凡乐 on 16/1/6.
//
//

#import <Foundation/Foundation.h>

@interface NFLFriendsModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign)BOOL vip;



-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)friendsWithDict:(NSDictionary *)dict;

+ (NSArray *)friendsWithArray:(NSArray *)array;



@end
