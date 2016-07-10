//
//  Model.h
//  私人通讯录
//
//  Created by HEYANG on 15/12/5.
//  Copyright © 2015年 HEYANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

/** 联系人姓名 */
@property (nonatomic,copy) NSString *name;
/** 联系人号码 */
@property (nonatomic,copy) NSString *phoneNum;

@end
