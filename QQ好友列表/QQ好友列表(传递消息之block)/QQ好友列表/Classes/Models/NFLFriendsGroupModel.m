//
//  NFLFriendsGroupModel.m
//  
//
//  Created by 倪凡乐 on 16/1/6.
//
//

#import "NFLFriendsGroupModel.h"
#import "NFLFriendsModel.h"

@implementation NFLFriendsGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValue:dict[@"name"] forKey:@"name"];
        [self setValue:dict[@"online"] forKey:@"online"];
        
        self.friends = [NFLFriendsModel friendsWithArray:dict[@"friends"]];
    }
    
    
    return self;
}

+ (instancetype)friendsGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSArray *)friendsGroup
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil]];
    
    NSMutableArray *arrayM =[NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self friendsGroupWithDict:dict]];
    }
    return arrayM;
    
}

@end
