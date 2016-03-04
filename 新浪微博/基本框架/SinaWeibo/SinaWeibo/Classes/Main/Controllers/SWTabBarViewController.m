//
//  SWTabBarViewController.m
//  
//
//  Created by 倪凡乐 on 16/2/28.
//
//

#import "SWTabBarViewController.h"
#import "SWNavigationController.h"
#import "SWHomeController.h"
#import "SWMessageController.h"
#import "SWDiscoverController.h"
#import "SWMineController.h"

@interface SWTabBarViewController ()

@end

@implementation SWTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    SWHomeController *homeController = [[SWHomeController alloc]init];
    [self addChildViewController:homeController title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    SWMessageController *messageController = [[SWMessageController alloc]init];
    [self addChildViewController:messageController title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];

    SWDiscoverController *discoverController = [[SWDiscoverController alloc]init];
    [self addChildViewController:discoverController title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    SWMineController *mineController = [[SWMineController alloc]init];
    [self addChildViewController:mineController title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childController.title = title;
    childController.view.backgroundColor = MRandomColor;
    
    // 设置 tabBar 按钮图片, UIImageRenderingModeAlwaysOriginal 为不使用默认属性
    childController.tabBarItem.image = [UIImage imageNamed:image];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置字体样式，默认为选中蓝色，详见结尾
    // 普通状态
    NSMutableDictionary *textAttr = [[NSMutableDictionary alloc]init];
    textAttr[NSForegroundColorAttributeName] = MColor(113, 113, 113);
    textAttr[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [childController.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    // 选中状态
    NSMutableDictionary *selectedTextAttr = [[NSMutableDictionary alloc]init];
    selectedTextAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    selectedTextAttr[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [childController.tabBarItem setTitleTextAttributes:selectedTextAttr forState:UIControlStateSelected];
    
    // 给子控制器包装一个导航控制器
    SWNavigationController *navVc = [[SWNavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:navVc];
    
}



/**
 以下为官方文档中 UIFont 字典里可设置的文字样式，如不设置，默认为12号冬青字体
 NSString *const NSFontAttributeName;
 NSString *const NSParagraphStyleAttributeName;
 NSString *const NSForegroundColorAttributeName;
 NSString *const NSBackgroundColorAttributeName;
 NSString *const NSLigatureAttributeName;
 NSString *const NSKernAttributeName;
 NSString *const NSStrikethroughStyleAttributeName;
 NSString *const NSUnderlineStyleAttributeName;
 NSString *const NSStrokeColorAttributeName;
 NSString *const NSStrokeWidthAttributeName;
 NSString *const NSShadowAttributeName;
 NSString *const NSTextEffectAttributeName;
 NSString *const NSAttachmentAttributeName;
 NSString *const NSLinkAttributeName;
 NSString *const NSBaselineOffsetAttributeName;
 NSString *const NSUnderlineColorAttributeName;
 NSString *const NSStrikethroughColorAttributeName;
 NSString *const NSObliquenessAttributeName;
 NSString *const NSExpansionAttributeName;
 NSString *const NSWritingDirectionAttributeName;
 NSString *const NSVerticalGlyphFormAttributeName;
 */





@end
