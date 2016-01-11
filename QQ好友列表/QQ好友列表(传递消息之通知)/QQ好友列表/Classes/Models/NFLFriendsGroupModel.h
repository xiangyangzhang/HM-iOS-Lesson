//
//  NFLFriendsGroupModel.h
//  
//
//  Created by 倪凡乐 on 16/1/6.
//
//

#import <Foundation/Foundation.h>

@interface NFLFriendsGroupModel : NSObject

@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign)int online;
@property (nonatomic, assign)BOOL isOpen;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)friendsGroupWithDict:(NSDictionary *)dict;

+ (NSArray *)friendsGroup;


@end
