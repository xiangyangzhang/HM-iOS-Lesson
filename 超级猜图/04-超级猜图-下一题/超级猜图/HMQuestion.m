//
//  HMQuestion.m
//  
//
//  Created by 倪凡乐 on 15/10/12.
//
//

#import "HMQuestion.h"

@implementation HMQuestion

- (instancetype) initWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    //KVC,字典转模型，不需要逐个列举plist键值
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) questionWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

/** 返回所有题目数组 */

+ (NSArray *)questions
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self questionWithDict:dict]];
    }
    return arrayM;
                      
}

//新模型重写description方法方便调试
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {answer: %@, icon: %@, title: %@, options: %@ }",self.class,self,self.answer,self.icon,self.title,self.options];
}

@end
