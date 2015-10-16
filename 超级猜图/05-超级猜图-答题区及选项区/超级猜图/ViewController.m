//
//  ViewController.m
//  超级猜图
//
//  Created by 倪凡乐 on 15/10/5.
//  Copyright (c) 2015年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "HMQuestion.h"

# define kButtonWidth 35
# define kButtonHeight 35
# define kButtonMargin 10
# define kTotalCol 3

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UILabel *noLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionButton;


@property (nonatomic, strong) UIButton *cover;
@property (nonatomic, strong) NSArray *questions;

@property (nonatomic, assign) int index;

@property (weak, nonatomic) IBOutlet UIView *optionsView;
@property (weak, nonatomic) IBOutlet UIView *answerView;


@end

@implementation ViewController

- (NSArray *)questions
{
    if (_questions == nil) {
        _questions = [HMQuestion questions];
    }
    return _questions;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.index = -1;
    [self nextQuestion];
}

- (UIButton *)cover
{
    if (_cover == nil) {
        _cover = [[UIButton alloc] initWithFrame:self.view.bounds];//布满窗口
        _cover.backgroundColor = [[UIColor alloc] initWithWhite:0.0 alpha:0.5];//此处为颜色的透明度
        [self.view addSubview:_cover];
        _cover.alpha = 0.0;//此处为图层透明度
        
        //Target-action模式，调用smallImage方法，冒号表示方法含参数
        [_cover addTarget:self action:@selector(bigImage) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _cover;
}

//状态栏显示形式
//UIStatusBarStyleDefault：dark
//UIStatusBarStyleLightContent:light
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


//# program mark - 大图小图切换
- (IBAction)bigImage
{
    if (self.cover.alpha == 0.0) {
        //把图片移到最前面
        [self.view bringSubviewToFront:self.iconButton];
        
        //动画
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = w;
        CGFloat y = (self.view.bounds.size.height - h)*0.5;
        
        //控制动画时间
        [UIView animateWithDuration:1.0f animations:^{
            self.iconButton.frame = CGRectMake(0, y, w, h);
            _cover.alpha = 1.0;//此处为图层透明度
        }];
    }
    else{
        [UIView animateWithDuration:1.0f animations:^{
            self.iconButton.frame = CGRectMake(80, 90, 165, 165);
            self.cover.alpha = 0.0;
        }];
    }
    
}

//# program mark - 下一题
- (IBAction)nextQuestion
{
    self.index ++;
    HMQuestion *question = self.questions[self.index];
    
    self.noLabel.text = [NSString stringWithFormat:@"%d/%lu", self.index+1,(unsigned long)self.questions.count];
    self.titleLabel.text = question.title;
    [self.iconButton setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    
    self.nextQuestionButton.enabled = (self.index < self.questions.count-1);
    

    
    //先移除之前的按钮，注意循环写法
    for (UIButton *btn in self.answerView.subviews) {
        [btn removeFromSuperview];
    }
    
    CGFloat answerW = self.answerView.bounds.size.width;
    NSInteger length = question.answer.length;
    CGFloat answerX = (answerW - kButtonWidth*length - kButtonMargin*(length-1)) * 0.5;
    for (int i = 0; i < length; i++) {
        CGFloat x = answerX + (kButtonWidth + kButtonMargin) * i;
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, kButtonWidth, kButtonHeight)];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];

        
        [self.answerView addSubview:btn];
    }
    
    
    for (UIButton *btn in self.optionsView.subviews) {
        [btn removeFromSuperview];
    }
    
    NSInteger row = question.options.count / kTotalCol;
    CGFloat optionsW = self.optionsView.bounds.size.width;
    CGFloat optionsX =  (optionsW - kButtonWidth * row - kButtonMargin * (row - 1))*0.5;

    
    for (int i = 0; i < question.options.count; i++) {

        CGFloat x = optionsX + (kButtonWidth+kButtonMargin)*(i % row);
        CGFloat y = i / row * (kButtonHeight+kButtonMargin);


        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, kButtonWidth, kButtonHeight)];

        [btn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_right_highlighted"] forState:UIControlStateHighlighted];
        [btn setTitle:question.options[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self.optionsView addSubview:btn];
    }
    
    
}

@end






