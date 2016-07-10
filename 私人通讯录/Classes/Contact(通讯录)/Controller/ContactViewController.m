//
//  ContactTableViewController.m
//  私人通讯录
//
//  Created by HEYANG on 15/12/4.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "ContactViewController.h"
#import "Model.h"
#import "ModelManager.h"
#import "EditViewController.h"

@interface ContactViewController () <UIActionSheetDelegate>

/** 存储用户名 */
@property (nonatomic,copy) NSString *userName;

/** 存储添加的联系人信息 */
@property (nonatomic,strong)NSMutableArray<Model*> *contactArray;



@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置通讯录标题.用户名是从登录界面传递过来的.
    self.navigationItem.title = [NSString stringWithFormat:@"%@的通讯录",self.userName];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //刷新列表
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //在这里测试一下传过来的数据
//        NSLog(@"现在数组中：%@",self.contactArray);
    //刷新列表
//    [self.tableView reloadData];
}

- (IBAction)loginOut:(UIBarButtonItem *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"确定要退出么" delegate:self cancelButtonTitle:@"取消"
   destructiveButtonTitle:@"确定"
        otherButtonTitles:nil, nil];
    [actionSheet showInView:self.view];
}

#pragma mark - 重写modelArray的get方法，因为要使用可变数组的方法，那么前提是get获取这个可变数组对象
-(NSMutableArray<Model*> *)contactArray{
    if (_contactArray == nil) {
        _contactArray = [[ModelManager shareModelManager] modelArr];
    }
    return _contactArray;
}



#pragma mark - 重写userName的set方法
-(void)setUserName:(NSString *)userName{
    _userName = userName;
    
}



#pragma mark - ActionSheet的代理方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}






#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* ID = @"ContactID";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
    
    // Configure the cell...
    Model* model = self.contactArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.phoneNum;
    return cell;
}

#pragma mark - segue方法

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //当跳转进入EditViewController的页面，需要把点击的tableView的row传递给EditViewController
    if ([segue.destinationViewController isKindOfClass:[EditViewController class]]){
        ModelManager *manager = [ModelManager shareModelManager];
        manager.editIndex = [self.tableView indexPathForSelectedRow].row;
    }
}
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
