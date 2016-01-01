//
//  NFLMessage.h
//  
//
//  Created by 倪凡乐 on 16/1/1.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    NFLMessageModelTypeGatsby = 0,//Gatsby
    NFLMessageModelTypeJobs//Jobs
    
}NFLMessageModelType;

@interface NFLMessage : NSObject

@property (nonatomic, copy)NSString *text;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, assign)NFLMessageModelType type;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)messageWithDict:(NSDictionary *)dict;

+ (NSMutableArray *)message;





@end
