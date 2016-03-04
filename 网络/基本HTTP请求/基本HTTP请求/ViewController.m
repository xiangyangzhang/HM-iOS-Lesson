//
//  ViewController.m
//  基本HTTP请求
//
//  Created by 倪凡乐 on 16/2/22.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+MJ.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)login;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)login {
    
    NSString *usernameText = self.username.text;
    if (usernameText.length == 0) {
        [MBProgressHUD showError:@"请输入用户名"];
        return;
    }
    
    NSString *pwdText = self.password.text;
    if (pwdText.length == 0) {
        [MBProgressHUD showError:@"请输入密码"];
        return;
    }
    
    //POST请求
    NSURL *url = [NSURL URLWithString:@"http://v2ex.com/signin"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    NSString *param = [NSString stringWithFormat:@"u=%@&p=%@",usernameText,pwdText];
    
    //编码，防止中文用户名
    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
    
    //10秒后算超时
    request.timeoutInterval = 10;
    
    [request setValue:@"iPhone 6" forHTTPHeaderField:@"User-Agent"];
    
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",data);
        NSLog(@"%@",dict);
    }];
    
    
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
