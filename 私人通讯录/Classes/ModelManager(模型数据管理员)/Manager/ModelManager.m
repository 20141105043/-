//
//  ModelManager.m
//  私人通讯录
//
//  Created by HEYANG on 15/12/6.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import "ModelManager.h"

@implementation ModelManager

implementationSingleton(ModelManager);

-(NSMutableArray<Model *> *)modelArr{
    if (_modelArr==nil) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}


@end


