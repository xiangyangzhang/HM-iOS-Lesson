//
//  ViewController.m
//  图层的基本使用
//
//  Created by 倪凡乐 on 16/1/19.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UIView *redView;
@property (nonatomic, strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _redView = [[UIView alloc]initWithFrame:CGRectMake(80, 300, 200, 200)];
    
    _redView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_redView];
    
    [self viewLayer];
    
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"鸣人笑容"]];
    
    _imageView.frame = CGRectMake(80, 100, 200, 125);
    
    _imageView.userInteractionEnabled = YES;
    
    [self.view addSubview:_imageView];
    
    [self imageViewLayer];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:1 animations:^{
        
        //_imageView.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);//沿x、y、z旋转
        //_imageView.layer.transform =CATransform3DMakeScale(0.5, 0.5, 1);//沿x、y、z缩放
        //_imageView.layer.transform = CATransform3DMakeTranslation(100, 100, 0);//沿x、y、z平移
        
        
        //或者用KVC实现，注意第一个为layer的属性对应的类型，第二个为layer的属性
        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 0, 0)];
        [_imageView.layer setValue:value forKey:@"transform"];
    }];
}


- (void)imageViewLayer
{
    _imageView.layer.cornerRadius = 10;//圆角，正方形图片大到宽度的一半可变成圆形
    _imageView.layer.masksToBounds = YES;//实现剪裁，图片放在content上，需跟CALayer一起剪裁才能实现效果
    _imageView.layer.borderColor = [UIColor yellowColor].CGColor;
    _imageView.layer.borderWidth = 2;
}

- (void) viewLayer
{
    _redView.layer.shadowColor = [UIColor purpleColor].CGColor;//阴影颜色,CG类型
    _redView.layer.shadowOpacity = 2;//阴影不透明度
    _redView.layer.shadowOffset = CGSizeMake(10, 10);//阴影偏移
    _redView.layer.shadowRadius = 10;//阴影圆角
    _redView.layer.borderColor = [UIColor whiteColor].CGColor;//边框颜色
    _redView.layer.borderWidth = 2;//边框宽度
    
}

@end
