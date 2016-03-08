//
//  SWTitleMenuController.m
//  
//
//  Created by 倪凡乐 on 16/3/1.
//
//

#import "SWTitleMenuController.h"

@interface SWTitleMenuController ()

@end

@implementation SWTitleMenuController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"好友";
            break;
        case 1:
            cell.textLabel.text = @"兴趣";
            break;
        case 2:
            cell.textLabel.text = @"科技";
            break;
        case 3:
            cell.textLabel.text = @"旅游";
            break;
        case 4:
            cell.textLabel.text = @"新闻";
            break;
        default:
            cell.textLabel.text = @"企业";
            break;
    }
    
    return cell;
}




@end
