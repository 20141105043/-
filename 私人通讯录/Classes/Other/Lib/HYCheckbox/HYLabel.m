//
//  HYLabel.m
//  ProjectionTest
//
//  Created by HEYANG on 15/11/27.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "HYLabel.h"

@interface HYLabel ()



@end

@implementation HYLabel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(27, 2, 300, 20);
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [[UIColor alloc] initWithWhite:1 alpha:0];
        
    }
    return self;
}

+ (instancetype)shareHyLabel{
    return [[self alloc] init];
}

@end
