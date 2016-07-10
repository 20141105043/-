//
//  HYCheckBox.m
//  HYCheckBox1
//
//  Created by HEYANG on 15/12/3.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "HYCheckBox.h"
#import "HYView.h"
#import "HYLabel.h"

@interface HYCheckBox ()

/** 勾选和未勾选的布尔判断 */
@property(nonatomic,getter=isCheckOn,assign) BOOL checkOn;

/** 勾选区对象的引用 */
@property (nonatomic,weak)HYView *checkView;
/** 勾选区的中心点的横坐标 */
@property (nonatomic,assign)CGFloat check_x;
/** 勾选区的中心点的纵坐标 */
@property (nonatomic,assign)CGFloat check_y;

/** 文本区 */
@property (nonatomic,copy)NSString *labelText;
/** 文本区对象的引用 */
@property (nonatomic,weak)HYLabel *label;

@end


@implementation HYCheckBox

-(void)awakeFromNib{
    
    self.frame = CGRectMake(150, 0, 125, 25);
//    self.frame = CGRectMake(150, 150, 125, 25);
    self.backgroundColor = [[UIColor alloc] initWithWhite:1 alpha:0];
    
    //创建一个复选框区域
    HYView* checkView = [HYView shareHyView];
    [self addSubview:checkView];
    self.checkView = checkView;
    //创建一个文本区
    HYLabel* hyLabel = [HYLabel shareHyLabel];
    [self addSubview:hyLabel];
    self.label = hyLabel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //可以找一个UIView做父控件，然后将这个
//        self.frame = CGRectMake(150, 0, 125, 25);
        self.frame = CGRectMake(150, 150, 125, 25);
        self.backgroundColor = [[UIColor alloc] initWithWhite:1 alpha:0];
        
        //创建一个复选框区域
        HYView* checkView = [HYView shareHyView];
        [self addSubview:checkView];
        self.checkView = checkView;
        //创建一个文本区
        HYLabel* hyLabel = [HYLabel shareHyLabel];
        [self addSubview:hyLabel];
        self.label = hyLabel;
    }
    return self;
}
#pragma mark - 重写设置label的文本
-(void)setLabelText:(NSString *)labelText{
    _labelText= labelText;
    self.label.text = _labelText;
}

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    [self.checkView addTarget:target action:action forControlEvents:controlEvents];
}

-(BOOL)isCheckOn{
    _checkOn = self.checkView.isCheckOn;
    return _checkOn;
}
#pragma mark - 事件监听checkOn
- (void)changeValue{
    self.checkOn = !self.checkOn;
}

#pragma mark - 提供专门的方法设置checkOn的值
-(void)setCheckBool:(BOOL)checkOn{
    _checkOn = checkOn;
    [self.checkView setCheckBool:_checkOn];
}


@end
