//
//  HMQuestion.m
//
//
//  Created by 倪凡乐 on 15/10/12.
//
//

#import "HMQuestion.h"

@implementation HMQuestion
@synthesize image = _image;

- (UIImage *)image
{
    if(_image == nil){
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

- (instancetype) initWithDict:(NSDictionary *)dict
{
    self = [super init];
    
    //KVC,字典转模型，不需要逐个列举plist键值
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        [self randomOptions];
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

- (void)randomOptions
{
    self.options = [self.options sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
        int seed = arc4random_uniform(2);
        if (seed) {
            return [str1 compare:str2];
        }else{
            return [str2 compare:str1];
        }
    }];
    NSLog(@"%@",self.options);
}

//新模型重写description方法方便调试
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {answer: %@, icon: %@, title: %@, options: %@ }",self.class,self,self.answer,self.icon,self.title,self.options];
}

@end
