//
//  ViewController.m
//  手势识别
//
//  Created by 倪凡乐 on 16/1/18.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"鸣人笑容.png"]];
    _imageView.frame = CGRectMake(40, 200, 300, 170);
    //图片的交互设为yes
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    
    //添加手势识别
    [self addRotation];
    [self addPinch];
    
    NSLog(@"%s",__func__);
}

- (void)addPan
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [_imageView addGestureRecognizer:pan];
}
//拖动
-(void)pan:(UIPanGestureRecognizer *)pan
{
    // 获取手指移动的位置
    CGPoint trans = [pan translationInView:_imageView];
    
    _imageView.transform = CGAffineTransformTranslate(_imageView.transform, trans.x, trans.y);
    
    // 复位
    [pan setTranslation:CGPointZero inView:_imageView];
    NSLog(@"%@",NSStringFromCGPoint(trans));
}


- (void)addRotation
{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [_imageView addGestureRecognizer:rotation];
    
}
//旋转
- (void)rotation:(UIRotationGestureRecognizer *)rotation
{
    //旋转角度基于0度，停顿后再旋转会突兀
    //_imageView.transform = CGAffineTransformMakeRotation(rotation.rotation);
    //旋转角度基于上一次旋转
    _imageView.transform = CGAffineTransformRotate(_imageView.transform, rotation.rotation);
    NSLog(@"rotation");
    //复位，使旋转连贯
    rotation.rotation = 0;
}

- (void)addPinch
{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [_imageView addGestureRecognizer:pinch];
    
}

//捏合,放大缩小
- (void)pinch:(UIPinchGestureRecognizer *)pinch
{
    _imageView.transform = CGAffineTransformScale(_imageView.transform, pinch.scale, pinch.scale);
    NSLog(@"pinch");
    //复位
    pinch.scale = 1;
    
}

//默认只支持一个手势，除非实现代理方法
//Simultaneously同时
-(bool)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)addSwipe
{
    //添加手势识别
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    //往右扫
    //一个手势只能识别一个方向
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [_imageView addGestureRecognizer:swipe];

}

- (void)swipe:(UISwipeGestureRecognizer *)swipe
{
    NSLog(@"swipe");
}


//长按
-(void)longPress:(UILongPressGestureRecognizer *)longPress
{
    //只调用一次
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        NSLog(@"longPress");
    }
}

- (void)addTap
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    
    [_imageView addGestureRecognizer:tap];
    
}

// 这个触摸点能否触发手势
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    CGPoint currentPoint = [touch locationInView:_imageView];
//
//    if (currentPoint.x < _imageView.bounds.size.width * 0.5) {
//        return NO;
//    }else{
//
//        return YES;
//    }
//}


//点击
- (void)tap:(UITapGestureRecognizer *)tap
{
    NSLog(@"tap");
}



@end
