//
//  AddViewController.m
//  私人通讯录
//
//  Created by HEYANG on 15/12/5.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "AddViewController.h"
#import "Model.h"
#import "ModelManager.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

/** 模型管理器的引用 */
@property (nonatomic,strong)ModelManager *modelManger;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

#pragma mark - 重写ModelManger引用的get方法
-(ModelManager *)modelManger{
    _modelManger = [ModelManager shareModelManager];
    return _modelManger;
}

#pragma mark - 初始化方法
-(void)setup{
    [self.nameTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

- (IBAction)addClick {
    Model* model = [[Model alloc] init];
    model.name = self.nameTextF.text;
    model.phoneNum = self.phoneTextF.text;
    //然后把这个模型传给模型管理员
    [self.modelManger.modelArr addObject:model];
    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)textChange{
    self.addBtn.enabled = self.nameTextF.text.length && self.phoneTextF.text.length;
}

@end
