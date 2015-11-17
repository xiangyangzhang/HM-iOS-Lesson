//
//  ViewController.m
//  查看大图
//
//  Created by 倪凡乐 on 15/10/25.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;

@end

@implementation ViewController


- (void)setImage:(UIImage *)image
{
    _image = image;
    
    //设置图像视图内容
    self.imageView.image = image;
    //让图像视图根据图像自动调整大小
    [self.imageView sizeToFit];
    
    //告诉scrollView内部内容的实际大小
    self.scrollView.contentSize = image.size;
    
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
}

//用懒加载时，需删除stroyboard上的scrollView
- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        
        //初始化，大小等于屏幕大小
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        
        //设置边距
        _scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
        //不显示水平滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        //不显示垂直滚动条
        _scrollView.showsVerticalScrollIndicator = NO;
        
        //偏移位置为0
        _scrollView.contentOffset = CGPointMake(0, 0);
        
        //取消弹簧效果
        _scrollView.bounces = NO;
        
        //设置代理
        _scrollView.delegate = self;
        
        //设置最大/最小缩放比例
        _scrollView.maximumZoomScale = 2.0;
        _scrollView.minimumZoomScale = 0.05;
        
        [self.view addSubview:_scrollView];
        
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置图像
    self.image = [UIImage imageNamed:@"克罗地亚杜布罗夫尼克旧城区全景"];
    
}

#pragma mark - srcollView代理设置

//告诉scrollView缩放谁，要缩放的是imageView
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

//开始缩放，不用写，包含在viewForZoomingInScrollView中
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"%s",__func__);

}

//正在缩放，不用写，包含在viewForZoomingInScrollView中
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"%@",NSStringFromCGAffineTransform(self.imageView.transform));//记录缩放数据
}

//完成缩放，不用写，包含在viewForZoomingInScrollView中
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"%@",NSStringFromCGAffineTransform(self.imageView.transform));

}

@end
