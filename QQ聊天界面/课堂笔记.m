QQ界面frame模型运行过程

1> viewDidLoad -> super viewDidLoad
2> tableView生成,执行数据源方法
3> 调用message模型，确定单元格总数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

4> 调用messageCell自定义视图的初始化，调用自定义视图message中的messageFrame模型，调用message和messageFrame确定cell大小、位置及内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //调用messageCell自定义视图的初始化
    NFLMessageCell *cell = [NFLMessageCell messageCellWithTableView:tableView];
    
    //设定大小位置及内容
    NFLMessageFrame *messageFrame = self.message[indexPath.row];
    cell.messageFrame = messageFrame;
    
    return cell;
    
}

6> 调用行高计算模型
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NFLMessageFrame *messageFrame = self.message[indexPath.row];
    return messageFrame.cellH;
}

问题：调用模型时，为何单独写一个set方法，如本例中的- (void)setMessageFrame:(NFLMessageFrame *)messageFrame，而不直接写在init方法中
答：如果直接写在init中，NFLMessageFrame模型的代码要都写进去了

问题：为什么set方法第一句要先自身赋值
_messageFrame = messageFrame;
答：否则出了set方法就无效了

问题：为什么frame模型增加后，message模型要增加以下语句
NFLMessageFrame *mf = [[NFLMessageFrame alloc]init];
mf.message = message;
[arrayM addObject:mf];
答：因为行高计算需要
