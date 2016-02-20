//
//  ViewController.m
//  多线程-下载合并图片
//
//  Created by 倪凡乐 on 16/2/16.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self combineImage];
    
}

- (void)combineImage
{
    //1.队列组
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //2.下载图片1
    //增加__block后才能修改线程内的属性
    __block UIImage *image1 = nil;
    dispatch_group_async(group,queue, ^{
        NSURL *url1 = [NSURL URLWithString:@"http://g.hiphotos.baidu.com/image/pic/item/f2deb48f8c5494ee460de6182ff5e0fe99257e80.jpg"];
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        image1 = [UIImage imageWithData:data1];
    });
    
    //3.下载图片2
    __block UIImage *image2 = nil;
    dispatch_group_async(group,queue, ^{
        NSURL *url2 = [NSURL URLWithString:@"http://su.bdimg.com/static/superplus/img/logo_white_ee663702.png"];
        NSData *data2 = [NSData dataWithContentsOfURL:url2];
    image2 = [UIImage imageWithData:data2];
    });
    
    //4.合并图片
    // 保证以上两个线程均完成后，开始执行以下代码
    dispatch_group_notify(group, queue, ^{
        
        //开启一个位图的上下文
        UIGraphicsBeginImageContextWithOptions(image1.size, NO, 0.0);
        
        //绘制第一张图片
        CGFloat image1W = image1.size.width;
        CGFloat image1H = image1.size.height;
        [image1 drawInRect:CGRectMake(0,0,image1W,image1H)];
        
        //绘制第二张图片
        CGFloat image2W = image2.size.width * 0.2;
        CGFloat image2H = image2.size.height * 0.2;
        CGFloat image2X = image1W - image2W;
        CGFloat image2Y = image1H - image2H;
        [image2 drawInRect:CGRectMake(image2X, image2Y, image2W, image2H)];
        
        //得到上下文中的图片
        UIImage *fullImage = UIGraphicsGetImageFromCurrentImageContext();
        
        //结束上下文
        UIGraphicsEndImageContext();
        
        //5.回主线程显示图片
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = fullImage;
        });
        
    });
    
    
}

@end
