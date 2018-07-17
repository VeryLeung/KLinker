//
//  KLinkerModel.h
//  ydbus
//
//  Created by very on 2018/5/22.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 link模型
 */
@interface KLinkerModel : NSObject

/**
 协议头
 */
@property(nonatomic, copy)NSString *schema;

/**
 主类别
 */
@property(nonatomic, copy)NSString *module;

/**
 控制器类-简称
 */
@property(nonatomic, copy)NSString *controller;

/**
 方法名
 */
@property(nonatomic, copy)NSString *function;

/**
 参数
 */
@property(nonatomic, copy)NSDictionary *params;

/**
 通过url构建link模型
 */
+ (instancetype)modelForUrl:(NSString *)url;

@end
