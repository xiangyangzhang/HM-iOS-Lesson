//
//  NFLMessage.h
//  
//
//  Created by 倪凡乐 on 16/1/1.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    NFLMessagTypeGatsby = 0,//Gatsby
    NFLMessageTypeJobs//Jobs
    
}NFLMessageType;

@interface NFLMessage : NSObject

@property (nonatomic, copy)NSString *text;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, assign)NFLMessageType type;
@property (nonatomic, assign)BOOL hideTime;



-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)messageWithDict:(NSDictionary *)dict;

+ (NSMutableArray *)message;





@end
