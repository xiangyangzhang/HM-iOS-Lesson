//
//  HMQuestion.h
//  
//
//  Created by 倪凡乐 on 15/10/12.
//
//

#import <Foundation/Foundation.h>

@interface HMQuestion : NSObject

@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *answer;
@property (strong, nonatomic) NSArray *options;

- (instancetype) initWithDict:(NSDictionary *)dict;

+ (instancetype) questionWithDict:(NSDictionary *)dict;

/** 返回所有题目数组 */
+ (NSArray *)questions;

- (NSString *)description;


@end
