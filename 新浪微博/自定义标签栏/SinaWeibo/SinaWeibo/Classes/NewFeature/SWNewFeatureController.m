//
//  SWNewFeatureController.m
//  
//
//  Created by 倪凡乐 on 16/3/3.
//
//

#import "SWNewFeatureController.h"
#import "SWTabBarViewController.h"

@interface SWNewFeatureController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation SWNewFeatureController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    
    for (int i = 0; i<MNewFeatureCount; i++) {
        
        UIImageView *imageView =[[UIImageView alloc]init];
        NSString *imageStr = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image = [UIImage imageNamed:imageStr];
        imageView.size = scrollView.size;
        imageView.x = imageView.width * i;
        imageView.y = 0;
        [scrollView addSubview:imageView];
        
        // 最后一页添加分享按钮
        if (i == MNewFeatureCount - 1) {
        
            [self setLastImageView:imageView];

        }
    }
    
    // 如果想要某个方向上不能滚动，那么这个方向对应的尺寸数值传0即可
    scrollView.contentSize = CGSizeMake( MNewFeatureCount * scrollView.width, 0);
    // 取消弹簧效果
    scrollView.bounces = NO;
    // 取消水平滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    // 分页锁定
    scrollView.pagingEnabled = YES;
    
    [self.view addSubview:scrollView];
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = MNewFeatureCount;
    
    // 设置 Center 的时候，需先设置尺寸，坑
    // pageControl.width = 100;
    // pageControl.height = 40;
    // UIPageControl 上的小圆点是 UIPageControl 的子控件
    // 要想子控件不能被点击，只要设置父控件大小为0，这样子控件可以显示,不可交互
    CGFloat pageControlCenterX = scrollView.width * 0.5;
    CGFloat pageControlCenterY = scrollView.height - 50;
    CGPoint point = CGPointMake(pageControlCenterX, pageControlCenterY);
    pageControl.center = point;
    pageControl.currentPageIndicatorTintColor = MColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = MColor(189, 189, 189);
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;

}

- (void)setLastImageView:(UIImageView *)imageView
{
    // 设置父控件可交互，子控件方可交互
    imageView.userInteractionEnabled = YES;
    
    UIButton *shareBtn = [[UIButton alloc]init];
    shareBtn.size = CGSizeMake(200, 30);
    CGFloat shareBtnCenterX = MScreenWidth * 0.5;
    CGFloat shareBtnCenterY = MScreenHeight * 0.7;
    shareBtn.center = CGPointMake(shareBtnCenterX, shareBtnCenterY);
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    // 调整按钮内图片和文字的距离，自切
    shareBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:shareBtn];
    
    UIButton *startBtn = [[UIButton alloc]init];
    startBtn.size = CGSizeMake(100, 30);
    CGFloat startBtnCenterX = MScreenWidth * 0.5;
    CGFloat startBtnCenterY = MScreenHeight * 0.77;
    startBtn.center = CGPointMake(startBtnCenterX, startBtnCenterY);
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    startBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:startBtn];

}

- (void)shareClick:(UIButton *)shareBtn
{
    shareBtn.selected = !shareBtn.selected;
}

- (void)startClick
{
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    SWTabBarViewController *tabVc = [[SWTabBarViewController alloc]init];
    mainWindow.rootViewController = tabVc;
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


# pragma mark - scrollView 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    self.pageControl.currentPage = (int)(page+0.5);
}


@end
