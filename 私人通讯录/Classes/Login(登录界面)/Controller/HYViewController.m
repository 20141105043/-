//
//  ViewController.m
//  私人通讯录
//
//  Created by HEYANG on 15/12/3.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "HYViewController.h"
#import "HYCheckBox.h"
#import "MBProgressHUD+XMG.h"
#import "ContactViewController.h"

@interface HYViewController ()

@property (weak, nonatomic) IBOutlet HYCheckBox *check1;
@property (weak, nonatomic) IBOutlet HYCheckBox *check2;

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@end

@implementation HYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //为文本框设定好监听事件
    [self.accountTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
//    [self textChange];
    
    //添加checkbox实例对象
    [self.check1 setLabelText:@"保存密码"];
    [self.check1 addTarget:self
                    action:@selector(clickEvent1)
          forControlEvents:UIControlEventTouchUpInside];
    [self.check2 setLabelText:@"自动登录"];
    [self.check2 addTarget:self
                    action:@selector(clickEvent2)
          forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

//登录按钮点击时调用
//登录按钮点击时要做用户名密码的判断,不能够直接跳到下一个页面,所以要用手动型执行Seg.
//假设用户名:xmg 密码:123 (用户名密码一般都是在服务器端,客户端把用户名密码发给服务器,服务去验证后,响应给客户端)
- (IBAction)login:(UIButton *)sender {
    
    [MBProgressHUD showMessage:@"正在登录ing..."];
    
    //模拟网總延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //隐藏HUD
        [MBProgressHUD hideHUD];
        
        //判断用户名密码
        if([self.accountTextField.text isEqualToString:@"dingjie"] && [self.pwdTextField.text isEqualToString:@"111"]){
            //用户名密码正确,跳转到下一页
            //根据一个标识,手动执行指定的Segue
            [self performSegueWithIdentifier:@"login2Contact" sender:nil];
            //隐藏键盘
            [self.view endEditing:YES];
        }else{
            //用户名密码错误,请重新输入.
            //提示用户名密码错误.
            [MBProgressHUD showError:@"用户名或密码错误"];
        }
        
    });
    /**
     
     performSegueWithIdentifier:底层实现
     1.根据Identifier标识到StoryBoard去寻找没有这个segue线, 如果有就会帮你创建UIStoryboardSegue对象.
     2.设置UIStoryboardSegue的来源控制器seg.sourceViewController = self;
     3.创建Segue对象的目标控制器,并且给seg对象的目标控制器属性赋值
     4.通知来源控制器,segue线准备好了.会调用来源控制器的prepareForSegue方法.
     5.执行[segue perform]方法,perform方法当中, 拿到来源控制器的导航控制器,调用push方法,跳转到目标控制器.
     *[segue.sourceViewController.navigationController pushViewController:segue.destinationViewController animated:YES];
     */
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ContactViewController* viewController = segue.destinationViewController;
    [viewController setUserName:self.accountTextField.text];
}

#pragma mark - 文本框监听响应登录按钮的编辑状态
-(void)textChange{
    self.loginBtn.enabled = self.accountTextField.text.length && self.pwdTextField.text.length;
}

#pragma mark - 点击事件
#pragma mark - 关于复选框事件

//当记住密码取消选中，那么自动登录也要自动取消选中
- (void)clickEvent1{
    if (self.check1.isCheckOn == NO) {
        [self.check2 setCheckBool:NO];
    }
}
//当自动登录选中，那么记住密码也要自动选中
- (void)clickEvent2{
    if (self.check2.isCheckOn == YES) {
        NSLog(@"自动登录选中");
        [self.check1 setCheckBool:YES];
    }
}


@end
