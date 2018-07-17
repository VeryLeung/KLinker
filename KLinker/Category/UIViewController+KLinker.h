//
//  UIViewController+KLinker.h
//  ydbus
//
//  Created by very on 2018/5/23.
//  Copyright © 2018年 SIBAT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Stack.h"

@interface UIViewController (KLinker)

@property(nonatomic, copy)NSDictionary *kl_params;

+ (void)kl_route:(NSString *)function params:(NSDictionary *)params;

@end
