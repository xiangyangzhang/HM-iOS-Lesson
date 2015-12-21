//
//  NFLTableFooterView.m
//  
//
//  Created by 倪凡乐 on 15/12/20.
//
//

#import "NFLTableFooterView.h"

@interface NFLTableFooterView()

@property (weak, nonatomic) IBOutlet UIButton *loadMoreButton;
@property (weak, nonatomic) IBOutlet UIView *tipsView;

@end

@implementation NFLTableFooterView

- (IBAction)loadMore
{
    //1. 隐藏按钮
    self.loadMoreButton.hidden = YES;
    //2. 显示按钮
    self.tipsView.hidden = NO;
    
    //3. 延迟加载,用于从网络获得数据，用代理实现
    [self.delegate footerViewDidLoadButton:self];

}

- (void)endRefresh
{
    
    //4. 加载完成数据
    self.loadMoreButton.hidden = NO;
    self.tipsView.hidden = YES;
    
}

@end
