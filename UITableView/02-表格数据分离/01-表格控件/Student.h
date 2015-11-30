//
//  Student.h
//  
//
//  Created by 倪凡乐 on 15/11/30.
//
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

/** 头部信息 */
@property (nonatomic, copy) NSString *title;

/** 尾部信息 */
@property (nonatomic, copy) NSString *desc;

/** 学员编号 */
@property (nonatomic, copy) NSArray *students;

@end
