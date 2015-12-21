//
//  NFLTableFooterView.h
//  
//
//  Created by 倪凡乐 on 15/12/20.
//
//

#import <UIKit/UIKit.h>

@class NFLTableFooterView;

@protocol NFLTableFooterViewDelegate <NSObject>

//视图下按钮被点击
- (void)footerViewDidLoadButton:(NFLTableFooterView *)footerView;

@end

@interface NFLTableFooterView : UIView

//此处用weak，如果为强引用，会造成循环引用，内存泄露
@property (nonatomic,weak) id <NFLTableFooterViewDelegate>delegate;

- (void)endRefresh;

@end
