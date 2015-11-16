//
//  ViewController.m
//  用户登录
//
//  Created by 倪凡乐 on 15/10/25.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *pswText;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //打开键盘
    [self.userNameText becomeFirstResponder];
}

- (IBAction)login {
    
    NSLog(@"%@,%@",self.userNameText.text,self.pswText.text);
}


#pragma mark - 文本框成为代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    if (textField == self.userNameText) {
        //光标跳转至密码输入框
        [self.pswText becomeFirstResponder];
    }else if (textField == self.pswText) {
        [self login];
        
        //关闭键盘
        [self.pswText resignFirstResponder];

    }
    
    return YES;
}

@end
