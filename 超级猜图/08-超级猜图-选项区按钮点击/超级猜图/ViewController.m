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


# pragma mark - 大图小图切换
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

/**
 *  下一题
 *  主要方法保持简短的代码
 */
# pragma mark - 下一题
- (IBAction)nextQuestion
{
    //1、当前答题索引，递增
    self.index ++;
    
    if (self.index == self.questions.count) {
        NSLog(@"通关了");
        return;
    }
    
    //2、根据索引取出模型数据
    HMQuestion *question = self.questions[self.index];
    
    //3、创建基本信息
    [self getLabelInfo:question];
    
    //4、创建答案区按钮
    [self creatAnswerButton:question];
    
    //5、创建备选区按钮
    [self creatOptionsButton:question];
    
    
}

/** 显示标签信息 */
- (void)getLabelInfo:(HMQuestion *)question
{
    self.noLabel.text = [NSString stringWithFormat:@"%d/%lu", self.index+1,(unsigned long)self.questions.count];
    self.titleLabel.text = question.title;
    [self.iconButton setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    
    self.nextQuestionButton.enabled = (self.index < self.questions.count-1);
    
}

/** 创建答案区按钮 */

- (void)creatAnswerButton:(HMQuestion *)question
{
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
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.answerView addSubview:btn];
        [btn addTarget:self action:@selector(answerClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

/** 创建备选区按钮 */
- (void)creatOptionsButton:(HMQuestion *)question
{
    
    NSInteger row = question.options.count / kTotalCol;
    CGFloat optionsW = self.optionsView.bounds.size.width;
    CGFloat optionsX =  (optionsW - kButtonWidth * row - kButtonMargin * (row - 1))*0.5;
    
    if (self.optionsView.subviews.count != question.options.count) {
        for (int i = 0; i < question.options.count; i++) {
            
            CGFloat x = optionsX + (kButtonWidth+kButtonMargin)*(i % row);
            CGFloat y = i / row * (kButtonHeight+kButtonMargin);
            
            
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, kButtonWidth, kButtonHeight)];
            
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_right_highlighted"] forState:UIControlStateHighlighted];
            [btn setTitle:question.options[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [self.optionsView addSubview:btn];
            [btn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
        }

    }
    else{
        int i = 0;
        for (UIButton *btn in self.optionsView.subviews) {
            [btn setTitle:question.options[i++] forState:UIControlStateNormal];
            
            //点下一题之后恢复所有按钮可见
            btn.hidden =NO;
        }

    }
    
    
}

#pragma mark - 备选区按钮点击

- (void)optionClick:(UIButton *)button
{
    NSLog(@"%s",__func__);
    
    //1、找到答案区第一个字符为空的按钮
    UIButton *btn = [self firstAnswerButton];
    
    //如果按钮全满，什么都不做
    if (btn == nil) return;
        
    //2、设置答案区按钮标题等于备选区按钮
    [btn setTitle:button.currentTitle forState:UIControlStateNormal];
    
    //3、隐藏备选区按钮
    button.hidden = YES;

    //4、判断对错
    [self judge];
    
}

/** 判断对错 */
- (void)judge
{
    BOOL isFull = YES;
    NSMutableString *strM = [NSMutableString string];
    
    //判断是否填满
    for (UIButton *btn in self.answerView.subviews) {
        if (btn.currentTitle.length == 0) {
            isFull = NO;
            break;
        }else{
            [strM appendString:btn.currentTitle];
        }
    }
    
    //填满之后判断对错
    if (isFull) {
        HMQuestion *question = self.questions[self.index];
        
        if ([strM isEqualToString:question.answer] ) {
            [self setAnswerColor:[UIColor blueColor]];
            
            //等0.5s进入下一题
            [self performSelector:@selector(nextQuestion) withObject:nil afterDelay:0.5];
            
        }else{
            [self setAnswerColor:[UIColor redColor]];
        }

    }
    
}

/** 修改答案颜色 */
- (void)setAnswerColor:(UIColor *)color
{
    for (UIButton *btn in self.answerView.subviews) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
}

/** 找到第一个空的按钮 */
- (UIButton *)firstAnswerButton
{
    for (UIButton *btn in self.answerView.subviews) {
        if (btn.currentTitle.length == 0) {
            return btn;
        }
    }
    return nil;
}

#pragma mark - 答题区按钮点击

- (void)answerClick:(UIButton *)button
{
    //1、如果没字，直接返回
    if (button.currentTitle.length == 0) return;
    //2、查找备选区按钮
    UIButton *btn = [self setButtonTitle:button.currentTitle isHidden:YES];
            
    //3、备选区按钮显示
    btn.hidden = NO;
            
    //4、答题区按钮文字清除
    [button setTitle:@"" forState:UIControlStateNormal];
            
    //5、答题区颜色变黑
    [self setAnswerColor:[UIColor blackColor]];
    
    
}

#pragma mark - 提示

/** 恢复备选区按钮 */
- (UIButton *)setButtonTitle:(NSString *)btnTitle isHidden:(BOOL)isHidden
{
    
    for (UIButton *btn in self.optionsView.subviews) {
        if ([btn.currentTitle isEqualToString:btnTitle] && btn.hidden == isHidden  ) {
            [btn setTitle:btnTitle forState:UIControlStateNormal];
        }
}

- (IBAction)tipsClick
{
    //1、清除所有按钮
    for (UIButton *btn in self.answerView.subviews) {
        [self answerClick:btn];
    }
    //2、首个按钮加字
    self a
}

@end






