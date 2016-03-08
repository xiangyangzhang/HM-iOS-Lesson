//
//  SWDropdownMenu.h
//  
//
//  Created by 倪凡乐 on 16/2/29.
//
//

#import <UIKit/UIKit.h>

@interface SWDropdownMenu : UIView

@property (nonatomic, strong) UIView *content;
@property (nonatomic, strong) UIViewController *viewController;


+ (instancetype)menu;

- (void)showForm: (UIView *)form;

- (void)dismiss;

@end
