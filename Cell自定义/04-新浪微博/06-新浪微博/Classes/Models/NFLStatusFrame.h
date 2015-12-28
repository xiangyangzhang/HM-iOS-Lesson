//
//  NFLStatusFrame.h
//  
//
//  Created by 倪凡乐 on 15/12/28.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>//Xcode6后，需导入UIKit,CGRect才能识别

@class NFLStatus;

@interface NFLStatusFrame : NSObject

@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign, readonly) CGRect nameF;
@property (nonatomic, assign, readonly) CGRect vipF;
@property (nonatomic, assign, readonly) CGRect textF;
@property (nonatomic, assign, readonly) CGRect pictureF;

/** 行高 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

/** 所有控件的尺寸都可以通过Status来计算得出 */
@property (nonatomic, strong) NFLStatus *status;

/** 所有的statusFrame数据数组 */
+ (NSArray *)statusFrames;


@end
