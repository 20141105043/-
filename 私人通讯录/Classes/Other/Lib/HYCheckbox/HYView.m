
//
//  HYView.m
//  ProjectionTest
//
//  Created by HEYANG on 15/11/27.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "HYView.h"


@interface HYView ()

/** 勾选和未勾选的布尔判断 */
@property(nonatomic,getter=isCheckOn) BOOL checkOn;
/** 勾选区的中心点的横坐标 */
@property (nonatomic,assign)CGFloat check_x;
/** 勾选区的中心点的纵坐标 */
@property (nonatomic,assign)CGFloat check_y;
@end

@implementation HYView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(2, 2, 20, 20);
        [self addTarget:self action:@selector(clickEvent) forControlEvents:UIControlEventTouchUpInside];
        [self setup];
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        //阴影的透明度
        self.layer.shadowOpacity = 0.5f;
        //阴影的圆角度数
        self.layer.shadowRadius = 2.0f;
    }
    return self;
}
+ (instancetype)shareHyView{
    return [[self alloc] init];
}
#pragma mark - 初始化
-(void)setup{
    self.check_x = self.bounds.size.height;
    self.check_y = self.check_x;
}

#pragma mark - 点击触发事件
-(void)clickEvent{
    self.checkOn = !self.checkOn;
    [self setNeedsDisplay];
}

#pragma mark - 重写frame的set方法
-(void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

#pragma mark - 绘制的方法
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    if (self.checkOn == YES) {
        //画出一个打钩
        UIBezierPath* path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(self.check_x*0.1, self.check_y*0.333)];
        [path addLineToPoint:CGPointMake(self.check_x*0.4, self.check_y*0.766)];
        [path addLineToPoint:CGPointMake(self.check_x*0.925, self.check_y*0.125)];
        [path setLineWidth:2];
        [[UIColor blackColor] setStroke];
        [path stroke];
    }else if(self.checkOn == NO){
    }
    
}

#pragma mark - 提供设置isCheckOn的方法
-(void)setCheckBool:(BOOL)checkOn{
    self.checkOn = checkOn;
    [self setNeedsDisplay];
}
@end
