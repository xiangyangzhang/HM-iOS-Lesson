//
//  NFLFlagView.h
//  
//
//  Created by 倪凡乐 on 16/1/12.
//
//

#import <UIKit/UIKit.h>

@class NFLNationalFlag;

@interface NFLFlagSubView : UIView

+ (instancetype)flagSubView;

@property (nonatomic, strong)NFLNationalFlag *flag;



@end
