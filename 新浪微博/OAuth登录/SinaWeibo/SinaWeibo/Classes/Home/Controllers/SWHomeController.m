//
//  SWHomeController.m
//  
//
//  Created by 倪凡乐 on 16/2/28.
//
//

#import "SWHomeController.h"
#import "UIBarButtonItem+Extension.h"
#import "SWTitleButton.h"
#import "SWDropdownMenu.h"
#import "SWTitleMenuController.h"
#import "SWSearchBar.h"

#define Mmargin 5

@interface SWHomeController ()

@end

@implementation SWHomeController
          
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 通过工具类，自定义 barButtonItem，工程全部能用
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    // 设置首页标题栏
    SWTitleButton *titleButton = [[SWTitleButton alloc]init];
    [titleButton setTitle:@"首页" forState: UIControlStateNormal];
    [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    
    SWSearchBar *timelineSearchBar = [[SWSearchBar alloc]init];
    
    // 设置首页搜索框 frame
    CGFloat timelineSearchBarW = MScreenWidth - 30 ;
    CGFloat timelineSearchBarH = 30 ;
    CGFloat timelineSearchBarX = (MScreenWidth - timelineSearchBarW) * 0.5;
    CGFloat timelimeSearchBarY = - timelineSearchBarH - 10;
    timelineSearchBar.frame = CGRectMake(timelineSearchBarX, timelimeSearchBarY, timelineSearchBarW, timelineSearchBarH);
    [self.view addSubview:timelineSearchBar];

    
}

- (void)titleButtonClick:(UIButton *)titleButton
{
    SWDropdownMenu *dropdownMenu = [SWDropdownMenu menu];
    SWTitleMenuController *menuVc = [[SWTitleMenuController alloc]init];
    
    menuVc.view.x = Mmargin;
    menuVc.view.y = Mmargin;
    // 大小与 dropdown 中的 container 有关
    menuVc.view.width = 200 - Mmargin * 0.5;
    menuVc.view.height = 200 - Mmargin * 0.5;
    
    dropdownMenu.viewController = menuVc;
    
    [dropdownMenu showForm:titleButton];
    
    
}

- (void)friendSearch
{
    NSLog(@"friendsearch");
}

- (void)pop
{
    NSLog(@"pop");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
