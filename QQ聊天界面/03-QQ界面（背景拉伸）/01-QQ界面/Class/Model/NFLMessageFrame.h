//
//  NFLMessageFrame.h
//  
//
//  Created by 倪凡乐 on 16/1/2.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class NFLMessage;

@interface NFLMessageFrame : NSObject
//时间
@property (nonatomic, assign, readonly) CGRect timeF;
//头像
@property (nonatomic, assign, readonly) CGRect iconF;
//正文
@property (nonatomic, assign, readonly) CGRect textViewF;
//行高
@property (nonatomic, assign, readonly) CGFloat cellH;
//数据模型
@property (nonatomic, strong)NFLMessage *message;

@end
