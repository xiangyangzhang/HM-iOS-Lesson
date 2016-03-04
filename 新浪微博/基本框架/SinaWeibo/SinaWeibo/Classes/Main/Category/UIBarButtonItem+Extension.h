//
//  UIBarButtonItem+Extension.h
//
//
//  Created by 倪凡乐 on 16/2/28.
//
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
