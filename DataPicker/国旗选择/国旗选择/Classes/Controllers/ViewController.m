//
//  ViewController.m
//  国旗选择
//
//  Created by 倪凡乐 on 16/1/12.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLNationalFlag.h"
#import "NFLFlagSubView.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *flagArray;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UILabel *flagLabel;

@end

@implementation ViewController

- (NSArray *)flagArray
{
    if (_flagArray == nil) {
        _flagArray = [NFLNationalFlag nationalFlag];
    }
    return _flagArray;
}

- (UIPickerView *)pickerView
{
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 150, 0, 0)];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        
        [self.view addSubview:_pickerView];
        
    }
    return _pickerView;
}

- (UILabel *)flagLabel
{
    if (_flagLabel == nil) {
        _flagLabel = [[UILabel alloc]initWithFrame:CGRectMake(170, 440, 50, 50)];
        _flagLabel.textColor = [UIColor blackColor];
        [self.view addSubview:_flagLabel];
    }
    return _flagLabel;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self pickerView];
    

}

# pragma mark - pickerView数据源方法

//设置组数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//设置每组行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.flagArray.count;
}

//设置单元格内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    NFLNationalFlag *flags = self.flagArray[row];
    return flags.name;
}

//设置单元格自定义视图

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NFLNationalFlag *flag = self.flagArray[row];
    
    NFLFlagSubView *SubView = nil;
    
    if (SubView != nil) {
        SubView = (NFLFlagSubView *)view;
    }else{
        SubView = [NFLFlagSubView flagSubView];
    }
    
    SubView.flag = flag;
    return SubView;
}

//设置单元格高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}

//获得选中单元格
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NFLNationalFlag *flag = self.flagArray[row];
    self.flagLabel.text = flag.name;
}


@end
