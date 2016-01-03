//
//  ViewController.m
//  01-QQ界面
//
//  Created by 倪凡乐 on 16/1/1.
//  Copyright (c) 2016年 NFL. All rights reserved.
//

#import "ViewController.h"
#import "NFLMessage.h"
#import "NFLMessageFrame.h"
#import "NFLMessageCell.h"
#import "Constant.h"
#import "NFLAutoReply.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *message;
@property (nonatomic, strong)UIView *chatView;
@property (nonatomic, strong)UIButton *voiceButton;
@property (nonatomic, strong)UITextField *chatTextField;

@property (nonatomic, strong)UIButton *smileButton;
@property (nonatomic, strong)UIButton *addButton;
@property (nonatomic, strong)NSArray *autoReply;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        //_tableView.backgroundColor = [UIColor redColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        //留出底部边距
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, kNormalHeight, 0);
        
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

//聊天记录模型
- (NSMutableArray *)message
{
    if (_message == nil) {
        _message = [NFLMessage message];
    }
    return _message;
}

//自动回复模型
- (NSArray *)autoReply
{
    if (_autoReply == nil) {
        _autoReply = [NFLAutoReply autoReply];
    }
    return _autoReply;
}

//底部聊天窗口
- (UIView *)chatView
{
    if (_chatView == nil) {
        _chatView = [[UIView alloc]init];
        
        CGFloat chatViewX = 0;
        CGFloat chatViewY = self.view.bounds.size.height - kNormalHeight;
        CGFloat chatViewW = self.view.bounds.size.width;
        CGFloat chatViewH = kNormalHeight;

        _chatView.frame = CGRectMake(chatViewX,chatViewY,chatViewW,chatViewH);

        _chatView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        
        [self.view addSubview:_chatView];
        
        //添加声音按钮
        CGFloat voiceButtonX = kPadding * 0.5;
        CGFloat voiceButtonY = kPadding * 0.5;
        CGFloat voiceButtonW = kNormalWidth-kPadding;
        CGFloat voiceButtonH = kNormalHeight-kPadding;
        
        _voiceButton = [[UIButton alloc]initWithFrame:CGRectMake(voiceButtonX,voiceButtonY,voiceButtonW,voiceButtonH)];
        [_voiceButton setImage:[UIImage imageNamed:@"chat_bottom_voice_nor"] forState:UIControlStateNormal];
        [_voiceButton setImage:[UIImage imageNamed:@"chat_bottom_voice_press"] forState:UIControlStateHighlighted];

        [_chatView addSubview:_voiceButton];
        
        //添加输入框
        CGFloat chatTextFieldX = CGRectGetMaxX(_voiceButton.frame) + kPadding*0.5;
        CGFloat chatTextFieldY = kPadding * 0.5;
        CGFloat chatTextFieldW = chatViewW - kNormalWidth * 3;
        CGFloat chatTextFieldH = kNormalHeight-kPadding;
        
        _chatTextField = [[UITextField alloc]initWithFrame:CGRectMake(chatTextFieldX, chatTextFieldY, chatTextFieldW, chatTextFieldH)];
        
        [_chatTextField setBackground:[UIImage imageNamed:@"chat_bottom_textfield"]];
        
        //设置输入框左边距,两个语句配套使用
        _chatTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kPadding, 0)];
        _chatTextField.leftViewMode = UITextFieldViewModeAlways;
        
        //允许粘贴
        _chatTextField.allowsEditingTextAttributes = YES;
        
        _chatTextField.delegate = self;
        
        [_chatView addSubview:_chatTextField];

        //添加微笑按钮
        CGFloat smileButtonX = CGRectGetMaxX(_chatTextField.frame) + kPadding*0.5;
        CGFloat smileButtonY = kPadding * 0.5;
        CGFloat smileButtonW = kNormalWidth - kPadding;
        CGFloat smileButtonH = kNormalHeight - kPadding;
        _smileButton = [[UIButton alloc]initWithFrame:CGRectMake(smileButtonX, smileButtonY, smileButtonW, smileButtonH)];
        [_smileButton setImage:[UIImage imageNamed:@"chat_bottom_smile_nor"] forState:UIControlStateNormal];
        [_smileButton setImage:[UIImage imageNamed:@"chat_bottom_smile_press"] forState:UIControlStateHighlighted];

        [_chatView addSubview:_smileButton];

        //添加按钮
        CGFloat addButtonX = CGRectGetMaxX(_smileButton.frame) + kPadding*0.5;
        CGFloat addButtonY = kPadding * 0.5;
        CGFloat addButtonW = kNormalWidth - kPadding;
        CGFloat addButtonH = kNormalHeight - kPadding;
        _addButton = [[UIButton alloc]initWithFrame:CGRectMake(addButtonX, addButtonY, addButtonW, addButtonH)];
        [_addButton setImage:[UIImage imageNamed:@"chat_bottom_up_nor"] forState:UIControlStateNormal];
        [_addButton setImage:[UIImage imageNamed:@"chat_bottom_up_press"] forState:UIControlStateHighlighted];
        [_chatView addSubview:_addButton];
        
        
    }
    return _chatView;
}

//视图加载
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self tableView];
    
    [self chatView];
    
    //cell 不可选中
    self.tableView.allowsSelection = NO;
    
    //设置背景色
    self.tableView.backgroundColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0];
    
    //取消分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //添加键盘监听,addObserver为监听者，seletor为监听后执行方法，name为监听事件，object为发出事件对象
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//添加一条聊天信息
- (void)addMessage:(NSString *)text type:(NFLMessageType)type
{
    //1. 添加模型数据
    NFLMessage *msg = [[NFLMessage alloc]init];
    
    //设置数据值
    //msg.time = @"16:10";
    msg.text = text;
    msg.type = type;
    
    //设置内容的frame
    NFLMessageFrame *mf = [[NFLMessageFrame alloc]init];
    
    //将msg赋值给fm中的message
    mf.message = msg;
    [self.message addObject:mf];
    
    //2. 刷新表格
    [self.tableView reloadData];
    
    //3. 自动上移
    //移动位置
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.message.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}

//自动回复
- (NSString *)autoReplyWithText:(NSString *)text
{

//    for (int i = 0; i<self.autoReply.count; i++) {
//       NSString *key = [[self.autoReply objectAtIndex:i] objectForKey:@"send"];
//
//       if ([text isEqualToString:key]) {
//           return [[ar objectAtIndex:i] objectForKey:@"reply"];
//        }
//    }
    return @"你走！";
}

# pragma mark - 数据源方法
//单元格总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.message.count;
}

//单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //声明cell，分配空间，初始化
    NFLMessageCell *cell = [NFLMessageCell messageCellWithTableView:tableView];

    //设定大小位置及内容
    NFLMessageFrame *messageFrame = self.message[indexPath.row];
    cell.messageFrame = messageFrame;
    
    return cell;

}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NFLMessageFrame *messageFrame = self.message[indexPath.row];
    return messageFrame.cellH;
}

# pragma mark - 输入框代理方法


//键盘弹出后改变视图
- (void)keyboardDidChangeFrame:(NSNotification *)noti
{
    //    UIKeyboardAnimationCurveUserInfoKey = 7;  动画曲线动画
    //    UIKeyboardAnimationDurationUserInfoKey = "0.25"; 动画时间
    //    UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {320, 216}}"; 键盘bounds
    //    UIKeyboardCenterBeginUserInfoKey = "NSPoint: {160, 588}";  开始键盘的居中位置
    //    UIKeyboardCenterEndUserInfoKey = "NSPoint: {160, 372}";结束键盘的居中位置
    //    UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 480}, {320, 216}}"; 开始键盘的frame
    //    UIKeyboardFrameChangedByUserInteraction = 0;   键盘改变frame
    //    UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 264}, {320, 216}}"; 最终键盘的frame
    //    NSLog(@"-----%@",noti.userInfo);
    
    //改变window背景颜色，对键盘颜色也有影响
    self.view.window.backgroundColor = self.tableView.backgroundColor;
    
    //最终键盘的frame
    CGRect frame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    //键盘实时y
    CGFloat keyboardY = frame.origin.y;
    
    //屏幕高度
    CGFloat screenH = [[UIScreen mainScreen] bounds].size.height;
    
    //动画时间
    CGFloat keyboardDuration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //执行动画
    [UIView animateWithDuration:keyboardDuration animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY-screenH);}];
}

//send按钮实现
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"-------%@",textField.text);

    //发送一条数据
    [self addMessage:textField.text type:NFLMessagTypeGatsby];
    
    //自动回复
    NSString *autoStr = [self autoReplyWithText:textField.text];
    
    [self addMessage:autoStr type:NFLMessageTypeJobs];

    
    //清空表格
    self.chatTextField.text = @"";
    
    return YES;
}


# pragma mark - 表格代理方法
//当tableView滚动时，结束编辑事件
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}


@end
