//
//  ViewController.m
//  UIWebView代理
//
//  Created by 倪凡乐 on 16/2/27.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardBtn;

- (IBAction)back;
- (IBAction)forwoard;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    webView.backgroundColor = [UIColor redColor];
    [self.view addSubview:webView];
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"login" withExtension:@"index"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

- (IBAction)back{
}

- (IBAction)forwoard{
}
@end
