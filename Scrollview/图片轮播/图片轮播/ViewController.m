//
//  ViewController.m
//  图片轮播
//
//  Created by 倪凡乐 on 15/11/16.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"

#define kImageCount 3

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation ViewController

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 20, 338, 182)];
        _scrollView.backgroundColor = [UIColor redColor];
        
        //取消滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        //取消弹簧效果
        _scrollView.bounces = NO;
        //分页
        _scrollView.pagingEnabled = YES;
        
        
        [self.view addSubview:_scrollView];
        
        self.scrollView.contentSize =CGSizeMake(kImageCount*_scrollView.bounds.size.width, 0);
        
        //设置代理
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        //分页控件
        _pageControl = [[UIPageControl alloc] init];
        //总页数
        _pageControl.numberOfPages = kImageCount;
        //控件尺寸
        CGSize size = [_pageControl sizeForNumberOfPages:kImageCount];
        _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
        _pageControl.center = CGPointMake(self.view.center.x, 190);
        
        //设置颜色
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        
        [self.view addSubview:_pageControl];
        
        //设置代理
        //UIControl类除了按钮，其余监听方法均为UIControlEventValueChanged
        [_pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _pageControl;
}

- (void)pageChanged:(UIPageControl *)page
{
    CGFloat x =page.currentPage * _scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0)];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置图像
    for (int i = 0; i < kImageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"img_%02d",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.scrollView.bounds];
        imageView.image = image;
        
        [self.scrollView addSubview:imageView];
    }
        
    //计算imageView位置
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        
        CGRect frame = imageView.frame;
        frame.origin.x = idx*frame.size.width;
        
        imageView.frame = frame;
        
    }];
    
    self.pageControl.currentPage =0;
    
}

#pragma mark - ScollView代理方法

// 滚动视图停下来，修改页面控件小点（页数）
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //计算页数
    int page = scrollView.contentOffset.x / _scrollView.frame.size.width;
    
    //同步pageControl
    self.pageControl.currentPage = page;
}


@end
