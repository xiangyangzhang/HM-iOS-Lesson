//
//  NFLMessage.m
//  
//
//  Created by 倪凡乐 on 16/1/1.
//
//

#import "NFLMessage.h"
#import "NFLMessageFrame.h"

@implementation NFLMessage

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)messageWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSMutableArray *)message
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        NFLMessage *message = [NFLMessage messageWithDict:dict];
        
        //取出上一个模型
        NFLMessageFrame *lastmf = [arrayM lastObject];
        
        //隐藏时间
        message.hideTime = [message.time isEqualToString:lastmf.message.time];
        
        //frame模型增加后，此语句不可落下
        NFLMessageFrame *mf = [[NFLMessageFrame alloc]init];
        mf.message = message;
        
        [arrayM addObject:mf];
    }
    return arrayM;
    
}

@end
