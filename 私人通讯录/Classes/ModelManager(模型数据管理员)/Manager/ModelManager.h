//
//  ModelManager.h
//  私人通讯录
//
//  Created by HEYANG on 15/12/6.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "Singleton.h"

@interface ModelManager : NSObject

/** 存储模型的队列数组 */
@property (nonatomic,strong)NSMutableArray<Model*> *modelArr;

/** 下标 */
@property (nonatomic,assign)NSInteger editIndex;

interfaceSingleton(ModelManager);

@end
