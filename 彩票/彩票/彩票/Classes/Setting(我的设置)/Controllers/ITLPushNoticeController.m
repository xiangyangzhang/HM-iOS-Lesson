//
//  ITLPushNoticeController.m
//  
//
//  Created by 倪凡乐 on 16/2/10.
//
//

#import "ITLPushNoticeController.h"
#import "ITLSettingItem.h"
#import "ITLSettingArrowItem.h"
#import "ITLSettingGroup.h"

@interface ITLPushNoticeController ()

@end

@implementation ITLPushNoticeController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addGroup0];

}

- (void)addGroup0
{
    
    ITLSettingItem *push = [ITLSettingArrowItem itemWithIcon:nil title:@"开奖号码推送" devtVcClass:nil];
    ITLSettingItem *anim = [ITLSettingArrowItem itemWithIcon:nil title:@"中奖动画" devtVcClass:nil];
    ITLSettingItem *score = [ITLSettingArrowItem itemWithIcon:nil title:@"比分直播" devtVcClass:nil];
    ITLSettingItem *timer = [ITLSettingArrowItem itemWithIcon:nil title:@"中彩定时提醒" devtVcClass:nil];

    ITLSettingGroup *group0 = [[ITLSettingGroup alloc]init];
    group0.items = @[push,anim,score,timer];
    
    [self.datalist addObject:group0];
    
    
}




@end
