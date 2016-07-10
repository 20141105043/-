//
//  EditViewController.m
//  私人通讯录
//
//  Created by HEYANG on 15/12/6.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "EditViewController.h"
#import "ModelManager.h"


@interface EditViewController () <UIActionSheetDelegate>

/** name文本框 */
@property (nonatomic,weak)IBOutlet UITextField *nameTF;

/** 电话文本框 */
@property (nonatomic,weak)IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

/** 模型数据管理中的模型对应数组的下标 */
@property (nonatomic,assign)NSInteger index;


@end

@implementation EditViewController


-(void)viewDidLoad{
    [self setup];
}



#pragma mark - 初始化方法
-(void)setup{
    ModelManager *manger = [ModelManager shareModelManager];
    self.phoneTF.text = manger.modelArr[self.index].phoneNum;
    self.nameTF.text = manger.modelArr[self.index].name;
}

#pragma mark - 编辑按钮
- (IBAction)editBtn:(UIBarButtonItem *)sender {
    
    self.saveButton.enabled = YES;
    if ([sender.title isEqualToString:@"编辑"]) {
        sender.title = @"取消";
        self.phoneTF.enabled = YES;
        self.nameTF.enabled = YES;
    }else if ([sender.title isEqualToString:@"取消"]){
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - 保存按钮对应的事件监听方法
- (IBAction)saveBtn {
    //首先需要判断任何一个文本框是否为空，其中一个为空都会提示是否删除该联系人
    if (self.nameTF.text.length == 0 || self.phoneTF.text.length == 0) {
        UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:@"是否删除该联系方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [sheet showInView:self.view];
    }else{
        
        ModelManager *manger = [ModelManager shareModelManager];
        manger.modelArr[self.index].name = self.nameTF.text;
        manger.modelArr[self.index].phoneNum = self.phoneTF.text;
        //最后要退出
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

#pragma mark - UIActionDelegate相关方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"Hello~");
        //删除当前联系人
        ModelManager *manger = [ModelManager shareModelManager];
        [manger.modelArr removeObject:manger.modelArr[self.index]];
    }
    //最后要退出
    [self.navigationController popViewControllerAnimated:YES];
}

@end
