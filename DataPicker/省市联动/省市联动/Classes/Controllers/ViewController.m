//
//  ViewController.m
//  省市联动
//
//  Created by 倪凡乐 on 16/1/13.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLProvinces.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong)UIPickerView *pickerView;
@property (nonatomic, strong)NSArray *provinces;
@property (nonatomic, assign)int provinceIndex;

@end

@implementation ViewController

- (UIPickerView *)pickerView
{
    if (_pickerView == nil) {
        
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 200, 0, 0)];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;

        [self.view addSubview:_pickerView];
        
    }
    return _pickerView;
}

- (NSArray *)provinces
{
    if (_provinces == nil) {
        _provinces = [NFLProvinces province];
    }
    return _provinces;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self pickerView];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.provinces.count;
    }else{
        NFLProvinces *province = self.provinces[self.provinceIndex];
        return province.cities.count;
    }
}

//设置两栏自定义视图
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = nil;
    if (view != nil) {
        label = (UILabel *)view;
    }else{
        label = [[UILabel alloc]init];
    }
    
    if (component == 0) {
        //显示省份
        NFLProvinces *province = self.provinces[row];
        label.text = province.name;
        label.bounds = CGRectMake(0, 0, 100, 44);

    }else{
        //默认显示第一城市
        NFLProvinces *province = self.provinces[self.provinceIndex];
        label.text = province.cities[row];
        label.bounds = CGRectMake(0, 0, 60, 44);//设置label宽度

    }
    
    return label;
}

//实现省市联动
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //省份选中
    if (component == 0) {
        //更改当前的索引
        self.provinceIndex = (int)row;
        //刷新右侧数据
        [self.pickerView reloadComponent:1];
        //重新设置右边的数据显示第一行
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
        
    }
}

//设置行高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 44;
}
//设置列宽
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component ==0) {
        return 150;
    }else{
        return 100;
    }
}

@end
