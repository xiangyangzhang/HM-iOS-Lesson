//
//  ViewController.m
//  DatePicker
//
//  Created by 倪凡乐 on 16/1/15.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, strong)UIDatePicker *datePicker;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(85, 100, 200, 44)];
    self.textField.placeholder = @"input your birthday";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    
    //设置datePicker
    self.datePicker = [[UIDatePicker alloc]init];
    self.textField.inputView = self.datePicker;
    
    //打印查看本地化标签
    NSArray *idents = [NSLocale availableLocaleIdentifiers];
    NSLog(@"%@",idents);
              
    //本地化
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    
    //显示年月日
    self.datePicker.datePickerMode =UIDatePickerModeDate;

    
    UIToolbar *toolbar = [[UIToolbar alloc]init];
    
    //一定要设置bounds 否则UIBarButtonItem监听不了点击事件
    toolbar.bounds = CGRectMake(0, 0, 320, 44);
    //创建上一个按钮
    UIBarButtonItem *previous = [[UIBarButtonItem alloc]initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:self action:nil];
    //创建下一个按钮
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:nil];
    //创建弹簧
    UIBarButtonItem *tanhuangBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //创建完成按钮
    UIBarButtonItem *finish = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishSelectedDate)];

    toolbar.items = @[previous, next, tanhuangBtn, finish];
    
    //把toolbar添加到键盘上
    self.textField.inputAccessoryView = toolbar;
    
    [self.view addSubview:self.textField];
    
}

- (void)finishSelectedDate
{
    //获取时间
    NSDate *selectedDate = self.datePicker.date;
    
    //格式化日期(2014-08-25)
    //格式化日期类
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    
    //设置日期格式
    formater.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [formater stringFromDate:selectedDate];
    
    //设置textfiled的文本
    
    self.textField.text = dateStr;
    
    //隐藏键盘
    [self.textField resignFirstResponder];

}


@end
